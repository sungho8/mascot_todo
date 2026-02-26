import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/user/get_user_stats_usecase.dart';
import '../../../domain/usecases/auth/sign_out_usecase.dart';
import '../../../di/home/home_providers.dart';
import '../../../di/auth/auth_providers.dart';
import 'settings_state.dart';

part 'settings_viewmodel.g.dart';

/// 설정 화면 ViewModel
@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  late final GetUserStatsUseCase _getUserStatsUseCase;
  late final SignOutUseCase _signOutUseCase;

  @override
  SettingsState build() {
    _getUserStatsUseCase = ref.read(getUserStatsUseCaseProvider);
    _signOutUseCase = ref.read(signOutUseCaseProvider);

    // 초기 데이터 로드
    Future.microtask(() => loadUserData());

    return const SettingsState();
  }

  /// 사용자 데이터 로드
  Future<void> loadUserData() async {
    state = state.copyWith(status: SettingsStatus.loading);

    final result = await _getUserStatsUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(
          status: SettingsStatus.error,
          errorMessage: failure.when(
            serverError: (msg) => msg ?? '서버 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '데이터를 불러올 수 없습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
      },
      (user) {
        state = state.copyWith(
          status: SettingsStatus.loaded,
          user: user,
          errorMessage: null,
        );
      },
    );
  }

  /// 로그아웃
  /// Supabase 세션 종료 및 로컬 토큰 삭제
  Future<void> logout() async {
    state = state.copyWith(status: SettingsStatus.loading);

    // Supabase signOut 호출 (백엔드 세션 종료 + 로컬 토큰 자동 삭제)
    final result = await _signOutUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(
          status: SettingsStatus.error,
          errorMessage: failure.when(
            serverError: (msg) => msg ?? '로그아웃 중 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '로그아웃 중 오류가 발생했습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
      },
      (_) {
        // 로그아웃 성공
        state = state.copyWith(
          status: SettingsStatus.logoutSuccess,
          user: null,
          errorMessage: null,
        );
      },
    );
  }
}
