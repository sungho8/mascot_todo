import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../models/auth/user_model.dart';

/// 인증 Remote DataSource
abstract class AuthRemoteDataSource {
  /// 카카오 로그인
  Future<UserModel> signInWithKakao();

  /// 비회원 로그인
  Future<UserModel> signInAnonymously();

  /// 로그아웃
  Future<void> signOut();

  /// 현재 로그인된 사용자 정보 가져오기
  Future<UserModel?> getCurrentUser();

  /// 인증 상태 변경 스트림
  Stream<UserModel?> authStateChanges();
}

/// 인증 Remote DataSource 구현체
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Logger _logger = Logger();

  @override
  Future<UserModel> signInWithKakao() async {
    try {
      // 1. 카카오 로그인 (카카오톡 or 카카오계정)
      OAuthToken token;
      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
        _logger.i('카카오톡으로 로그인 성공');
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
        _logger.i('카카오계정으로 로그인 성공');
      }

      final idToken = token.idToken;
      if (idToken == null) {
        throw Exception('카카오 ID 토큰을 받지 못했습니다. openid 스코프가 허용되었는지 확인하세요.');
      }

      // 2. 카카오 사용자 정보 가져오기
      final kakaoUser = await UserApi.instance.me();
      _logger.d('카카오 사용자 정보: ${kakaoUser.id}');

      // 3. Supabase에 카카오 ID 토큰으로 로그인
      final authResponse = await SupabaseService.client.auth.signInWithIdToken(
        provider: OAuthProvider.kakao,
        idToken: idToken,
        accessToken: token.accessToken,
      );

      if (authResponse.user == null) {
        throw Exception('Supabase 로그인 실패: 사용자 정보가 없습니다.');
      }

      _logger.i('✅ Supabase 로그인 성공: ${authResponse.user!.id}');

      // 4. 카카오 정보로 프로필 업데이트
      final updatedUser = await SupabaseService.client
          .from('users')
          .update({
            'kakao_id': kakaoUser.id.toString(),
            'nickname': kakaoUser.kakaoAccount?.profile?.nickname,
            'profile_image_url':
                kakaoUser.kakaoAccount?.profile?.profileImageUrl,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', authResponse.user!.id)
          .select()
          .single();

      _logger.i('✅ 사용자 프로필 업데이트 완료');

      return UserModel.fromJson(updatedUser);
    } catch (e, stackTrace) {
      _logger.e('카카오 로그인 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<UserModel> signInAnonymously() async {
    try {
      _logger.i('비회원 로그인 시도');

      final authResponse = await SupabaseService.client.auth
          .signInAnonymously();

      if (authResponse.user == null) {
        throw Exception('Supabase 비회원 로그인 실패: 사용자 정보가 없습니다.');
      }

      _logger.i('✅ Supabase 비회원 로그인 성공: ${authResponse.user!.id}');

      // 비회원 정보로 프로필 빈 데이터 업데이트/생성
      final updatedUser = await SupabaseService.client
          .from('users')
          .upsert({
            'id': authResponse.user!.id,
            'nickname': '게스트',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .select()
          .single();

      _logger.i('✅ 게스트 프로필 생성 완료');

      return UserModel.fromJson(updatedUser);
    } catch (e, stackTrace) {
      _logger.e('비회원 로그인 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // 1. 카카오 로그아웃
      try {
        await UserApi.instance.logout();
        _logger.i('카카오 로그아웃 성공');
      } catch (e) {
        _logger.w('카카오 로그아웃 실패 (무시됨)', error: e);
      }

      // 2. Supabase 로그아웃
      await SupabaseService.client.auth.signOut();
      _logger.i('✅ Supabase 로그아웃 성공');
    } catch (e, stackTrace) {
      _logger.e('로그아웃 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final currentUser = SupabaseService.currentUser;
      if (currentUser == null) {
        _logger.d('현재 로그인된 사용자 없음');
        return null;
      }

      final userResponse = await SupabaseService.client
          .from('users')
          .select()
          .eq('id', currentUser.id)
          .single();

      return UserModel.fromJson(userResponse);
    } catch (e, stackTrace) {
      _logger.e('현재 사용자 정보 조회 실패', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  @override
  Stream<UserModel?> authStateChanges() {
    return SupabaseService.authStateChanges.asyncMap((authState) async {
      final user = authState.session?.user;
      if (user == null) {
        _logger.d('인증 상태 변경: 로그아웃됨');
        return null;
      }

      try {
        final userResponse = await SupabaseService.client
            .from('users')
            .select()
            .eq('id', user.id)
            .single();

        _logger.d('인증 상태 변경: 로그인됨 (${user.id})');
        return UserModel.fromJson(userResponse);
      } catch (e) {
        _logger.w('인증 상태 변경 중 사용자 정보 조회 실패', error: e);
        return null;
      }
    });
  }
}
