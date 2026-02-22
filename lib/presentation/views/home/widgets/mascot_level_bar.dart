import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../domain/entities/mascot/mascot_entity.dart';

/// 마스코트 레벨업 게이지
class MascotLevelBar extends StatelessWidget {
  final MascotEntity? mascot;

  const MascotLevelBar({super.key, this.mascot});

  @override
  Widget build(BuildContext context) {
    if (mascot == null) {
      return const SizedBox.shrink();
    }

    final progress = mascot!.currentExp / mascot!.maxExp;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: const Icon(
                  Icons.pets,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),

              AppSpacing.hMd,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mascot!.name, style: AppTypography.h4),

                    AppSpacing.vXs,

                    Text(
                      'Lv.${mascot!.level}',
                      style: AppTypography.body2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                '${mascot!.currentExp.toInt()} / ${mascot!.maxExp.toInt()}',
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          AppSpacing.vMd,

          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.border,
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
