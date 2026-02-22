import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../viewmodels/statistics/statistics_viewmodel.dart';
import '../../../../domain/entities/statistics/mascot_growth_stat_entity.dart';

class MascotGrowthSection extends ConsumerWidget {
  const MascotGrowthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(statisticsViewModelProvider);
    final stats = state.mascotGrowthStats;
    final unlockedCount = stats.where((m) => m.isUnlocked).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('마스코트 성장', style: AppTypography.h3),

            Text(
              '마스코트 수집 $unlockedCount/${stats.length}',
              style: AppTypography.caption,
            ),
          ],
        ),

        AppSpacing.vSm,

        if (stats.isEmpty)
          const Center(child: Text('데이터가 없습니다', style: AppTypography.subtitle2))
        else
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: stats.length,
              separatorBuilder: (_, __) => AppSpacing.hMd,
              itemBuilder: (context, index) {
                final mascot = stats[index];
                return _buildMascotCard(mascot);
              },
            ),
          ),
      ],
    );
  }

  Widget _buildMascotCard(MascotGrowthStatEntity mascot) {
    if (!mascot.isUnlocked) {
      return Container(
        width: 140,
        padding: AppSpacing.cardPadding,
        decoration: BoxDecoration(
          color: AppColors.backgroundSecondary,
          borderRadius: AppRadius.card,
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, color: AppColors.textDisabled, size: 40),

            AppSpacing.vMd,

            const Text('???', style: AppTypography.subtitle1),

            AppSpacing.vXs,

            Text(
              'To-do ${mascot.linkedTodoCount}개 추가 완료시 해금',
              style: AppTypography.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final progress = mascot.maxExp > 0
        ? mascot.currentExp / mascot.maxExp
        : 0.0;

    return Container(
      width: 140,
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  mascot.mascotName,
                  style: AppTypography.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Lv.${mascot.currentLevel}',
                style: AppTypography.numberEmphasis.copyWith(fontSize: 14),
              ),
            ],
          ),

          const Spacer(),

          Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.pets, color: AppColors.primary),
            ),
          ),

          const Spacer(),

          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.backgroundSecondary,
            color: AppColors.primary,
            borderRadius: AppRadius.button,
          ),

          AppSpacing.vXs,

          Text(
            'Todo ${mascot.linkedTodoCount}개 완료',
            style: AppTypography.caption,
          ),
        ],
      ),
    );
  }
}
