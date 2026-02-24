import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/constants/route_path.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../viewmodels/auth/auth_viewmodel.dart';
import '../../viewmodels/auth/auth_state.dart';

/// 로그인 화면
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  void initState() {
    super.initState();
    // 첫 프레임 렌더링 후 인증 상태 확인
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authViewModelProvider.notifier).checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 에러 처리
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (next.status == AuthStatus.error && next.errorMessage != null) {
        SnackbarHelper.showError(context, next.errorMessage!);
      }

      // 로그인 성공 시 홈으로 이동
      if (next.status == AuthStatus.authenticated) {
        context.go(RoutePath.home);
      }
    });

    final state = ref.watch(authViewModelProvider);
    final isLoading = state.status == AuthStatus.loading;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 로고 영역
              const Icon(Icons.pets, size: 128, color: AppColors.primary),

              AppSpacing.vLg,

              Text(
                'Mascot Todo',
                style: AppTypography.h1.copyWith(color: AppColors.primary),
                textAlign: TextAlign.center,
              ),

              AppSpacing.vSm,

              Text(
                '할 일을 완료하여\n귀여운 마스코트를 수집하세요!',
                style: AppTypography.body1.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),

              AppSpacing.vXxl,
              AppSpacing.vXxl,

              // Web 환경인 경우 비회원 로그인 우선 표시 (AI 모니터링 및 테스트 용도)
              if (kIsWeb)
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            ref
                                .read(authViewModelProvider.notifier)
                                .signInAnonymously();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonPrimary,
                      foregroundColor: AppColors.textOnDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.textPrimary,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person_outline,
                                size: AppSpacing.md,
                                color: AppColors.textPrimary,
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Text(
                                '비회원 (Web 테스트) 로그인',
                                style: AppTypography.buttonMedium.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),

              if (kIsWeb) AppSpacing.vMd,

              // 카카오 로그인 버튼 (모바일 및 웹 겸용)
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          ref
                              .read(authViewModelProvider.notifier)
                              .signInWithKakao();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE500), // 카카오 노란색
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.black87,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/kakao_logo.png',
                              height: AppSpacing.md,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.chat_bubble,
                                  size: AppSpacing.md,
                                  color: Colors.black87,
                                );
                              },
                            ),

                            const SizedBox(width: AppSpacing.sm),

                            Text(
                              '카카오 로그인',
                              style: AppTypography.buttonMedium.copyWith(
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                ),
              ),

              AppSpacing.vMd,

              // 약관 동의 텍스트
              Text(
                '로그인 시 이용약관 및 개인정보처리방침에\n동의하는 것으로 간주됩니다.',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
