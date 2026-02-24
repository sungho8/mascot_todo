import 'package:flutter/material.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../domain/entities/user/user_entity.dart';

class SummaryCards extends StatelessWidget {
  final UserEntity user;

  const SummaryCards({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('요약', style: AppTypography.h3),

        AppSpacing.vSm,

        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          children: [
            _buildCard('연속 달성일', '${user.currentStreak}일', '🔥'),
            _buildCard('총 완료 수', '${user.totalCompleted}개', '✅'),
            _buildCard('하루 최고', '${user.dailyMaxCompleted}개', '⚡'),
            _buildCard('얼리버드', '${user.earlyBirdCount}회', '🌅'),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(String label, String value, String icon) {
    return Container(
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppRadius.card,
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(icon, style: AppTypography.h4),

              AppSpacing.hXxs,

              Text(label, style: AppTypography.caption),
            ],
          ),

          AppSpacing.vXs,

          Text(value, style: AppTypography.numberEmphasis),
        ],
      ),
    );
  }
}
