import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/utils/logger.dart';
import '../../../di/di.dart';
import 'auth_state.dart';

part 'auth_viewmodel.g.dart';

/// 인증 ViewModel
@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() {
    return const AuthState();
  }

  /// 인증 상태 확인 (LoginView에서 명시적으로 호출)
  Future<void> checkAuthStatus() async {
    state = state.copyWith(status: AuthStatus.loading);

    final getCurrentUserUseCase = ref.read(getCurrentUserUseCaseProvider);
    final result = await getCurrentUserUseCase();

    result.fold(
      (failure) {
        logger.w('인증 상태 확인 실패: ${failure.maybeMap(
          serverError: (e) => e.message,
          orElse: () => '알 수 없는 오류',
        )}');
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          user: null,
        );
      },
      (user) {
        if (user == null) {
          logger.d('현재 로그인된 사용자 없음');
          state = state.copyWith(
            status: AuthStatus.unauthenticated,
            user: null,
          );
        } else {
          logger.i('로그인 상태 확인: ${user.id}');
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: user,
          );
        }
      },
    );
  }

  /// 카카오 로그인
  Future<void> signInWithKakao() async {
    state = state.copyWith(
      status: AuthStatus.loading,
      errorMessage: null,
    );

    final signInWithKakaoUseCase = ref.read(signInWithKakaoUseCaseProvider);
    final result = await signInWithKakaoUseCase();

    result.fold(
      (failure) {
        final errorMessage = failure.maybeMap(
          serverError: (e) => e.message ?? '카카오 로그인에 실패했습니다.',
          networkError: (e) => e.message ?? '네트워크 연결을 확인해주세요.',
          orElse: () => '알 수 없는 오류가 발생했습니다.',
        );

        logger.e('카카오 로그인 실패: $errorMessage');
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: errorMessage,
        );
      },
      (user) {
        logger.i('✅ 카카오 로그인 성공: ${user.id}');
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
          errorMessage: null,
        );
      },
    );
  }

  /// 로그아웃
  Future<void> signOut() async {
    state = state.copyWith(status: AuthStatus.loading);

    final signOutUseCase = ref.read(signOutUseCaseProvider);
    final result = await signOutUseCase();

    result.fold(
      (failure) {
        final errorMessage = failure.maybeMap(
          serverError: (e) => e.message ?? '로그아웃에 실패했습니다.',
          orElse: () => '알 수 없는 오류가 발생했습니다.',
        );

        logger.e('로그아웃 실패: $errorMessage');
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: errorMessage,
        );
      },
      (_) {
        logger.i('✅ 로그아웃 성공');
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          user: null,
          errorMessage: null,
        );
      },
    );
  }
}
