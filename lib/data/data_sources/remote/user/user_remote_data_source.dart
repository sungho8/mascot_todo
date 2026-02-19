import 'package:logger/logger.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../models/user/user_model.dart';

/// User Remote DataSource 인터페이스
abstract class UserRemoteDataSource {
  /// 현재 사용자 정보 조회 (users + user_stats 조합)
  Future<UserModel> getCurrentUser();
}

/// User Remote DataSource 구현체
/// Supabase users 테이블과 user_stats 테이블을 조합하여 UserModel 생성
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Logger _logger = Logger();

  /// total_completed 기반 레벨 계산 (10개당 1레벨)
  static const int _expPerLevel = 100;
  static const int _todosPerLevel = 10;

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final currentUser = SupabaseService.currentUser;
      if (currentUser == null) throw Exception('로그인이 필요합니다');

      _logger.d('사용자 정보 조회: userId=${currentUser.id}');

      // users 테이블과 user_stats 테이블 병렬 조회
      final results = await Future.wait([
        SupabaseService.client
            .from('users')
            .select()
            .eq('id', currentUser.id)
            .single(),
        SupabaseService.client
            .from('user_stats')
            .select()
            .eq('user_id', currentUser.id)
            .single(),
      ]);

      final userData = results[0];
      final statsData = results[1];

      final totalCompleted = (statsData['total_completed'] as int?) ?? 0;
      final currentStreak = (statsData['current_streak'] as int?) ?? 0;

      // 레벨 계산
      final level = totalCompleted ~/ _todosPerLevel + 1;
      final currentExp =
          (totalCompleted % _todosPerLevel) * (_expPerLevel / _todosPerLevel);

      final model = UserModel(
        id: currentUser.id,
        name: (userData['nickname'] as String?) ?? '사용자',
        profileImagePath: userData['profile_image_url'] as String?,
        level: level,
        currentExp: currentExp,
        maxExp: _expPerLevel.toDouble(),
        totalCompleted: totalCompleted,
        currentStreak: currentStreak,
      );

      _logger.i('✅ 사용자 정보 조회 완료: ${model.name} (Lv.${model.level})');
      return model;
    } catch (e, stackTrace) {
      _logger.e('사용자 정보 조회 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
