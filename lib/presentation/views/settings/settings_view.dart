import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/constants/route_path.dart';
import '../../viewmodels/settings/settings_viewmodel.dart';
import '../../viewmodels/settings/settings_state.dart';
import '../../../core/utils/snackbar_helper.dart';

/// 설정 화면
class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('로그아웃'),
        content: const Text('정말 로그아웃 하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(settingsViewModelProvider.notifier).logout();
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('로그아웃'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider);

    // 에러 처리 및 로그아웃 성공 시 로그인 화면으로 이동
    ref.listen<SettingsState>(
      settingsViewModelProvider,
      (previous, next) {
        if (next.errorMessage != null) {
          SnackbarHelper.showError(context, next.errorMessage!);
        }

        // 로그아웃 성공 시 로그인 화면으로 이동
        if (next.status == SettingsStatus.logoutSuccess) {
          context.go(RoutePath.login);
        }
      },
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        elevation: 0,
        title: const Text(
          '설정',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: state.status == SettingsStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(context, ref, state),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, SettingsState state) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        _buildUserInfoSection(state),
        AppSpacing.vXl,
        _buildAccountSection(context, ref),
        AppSpacing.vXl,
      ],
    );
  }

  Widget _buildUserInfoSection(SettingsState state) {
    final user = state.user;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            backgroundImage: user?.profileImagePath != null
                ? NetworkImage(user!.profileImagePath!)
                : null,
            child: user?.profileImagePath == null
                ? Icon(
                    Icons.person,
                    size: 48,
                    color: AppColors.primary,
                  )
                : null,
          ),
          AppSpacing.vMd,
          Text(
            user?.name ?? '사용자',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          AppSpacing.vSm,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.stars,
                  size: 18,
                  color: AppColors.primary,
                ),
                AppSpacing.hXs,
                Text(
                  'Level ${user?.level ?? 1}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.vLg,
          _buildStatRow(
            '완료한 할 일',
            '${user?.totalCompleted ?? 0}개',
          ),
          AppSpacing.vMd,
          _buildStatRow(
            '현재 연속 달성',
            '${user?.currentStreak ?? 0}일',
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSection(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => _showLogoutDialog(context, ref),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            constraints: const BoxConstraints(minHeight: 56),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.logout,
                    size: 22,
                    color: AppColors.error,
                  ),
                ),
                AppSpacing.hMd,
                Expanded(
                  child: Text(
                    '로그아웃',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.error,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.error.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
