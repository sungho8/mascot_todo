import 'package:flutter/material.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../domain/entities/statistics/mascot_growth_stat_entity.dart';

class MascotGrowthSection extends StatelessWidget {
  const MascotGrowthSection({super.key});

  final List<MascotGrowthStatEntity> _dummyStats = const [
    MascotGrowthStatEntity(
      mascotId: '1',
      mascotName: '토리 (Tori)',
      currentLevel: 5,
      currentExp: 450,
      maxExp: 1000,
      linkedTodoCount: 120,
      isUnlocked: true,
    ),
    MascotGrowthStatEntity(
      mascotId: '2',
      mascotName: '펭펭 (Pengpeng)',
      currentLevel: 3,
      currentExp: 150,
      maxExp: 300,
      linkedTodoCount: 45,
      isUnlocked: true,
    ),
    MascotGrowthStatEntity(
      mascotId: '3',
      mascotName: '냥이 (Nyangi)',
      currentLevel: 1,
      currentExp: 20,
      maxExp: 100,
      linkedTodoCount: 12,
      isUnlocked: true,
    ),
    MascotGrowthStatEntity(
      mascotId: '4',
      mascotName: '미지의 마스코트',
      currentLevel: 1,
      currentExp: 0,
      maxExp: 100,
      linkedTodoCount: 50,
      isUnlocked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final unlockedCount = _dummyStats.where((m) => m.isUnlocked).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.auto_awesome_rounded,
                  color: AppColors.primary,
                  size: 24,
                ),
                AppSpacing.hSm,
                const Text('마스코트 성장 기록', style: AppTypography.h3),
              ],
            ),
            Text(
              '수집 진행률 $unlockedCount/${_dummyStats.length}',
              style: AppTypography.caption,
            ),
          ],
        ),
        AppSpacing.vSm,
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _dummyStats.length,
            separatorBuilder: (_, __) => AppSpacing.hMd,
            itemBuilder: (context, index) {
              final mascot = _dummyStats[index];
              return _buildMascotCard(mascot, index == 0);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMascotCard(MascotGrowthStatEntity mascot, bool isTopRank) {
    if (!mascot.isUnlocked) {
      return Container(
        width: 150,
        padding: AppSpacing.cardPadding,
        decoration: BoxDecoration(
          color: AppColors.backgroundSecondary,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, color: AppColors.textDisabled, size: 40),
            AppSpacing.vMd,
            const Text('???', style: AppTypography.subtitle1),
            AppSpacing.vXs,
            Text(
              '특정 조건 달성 시 해금',
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
    final remainingExp = mascot.maxExp - mascot.currentExp;

    return Container(
      width: 150,
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
        border: isTopRank
            ? Border.all(
                color: AppColors.warning.withValues(alpha: 0.6),
                width: 1.5,
              )
            : Border.all(color: Colors.transparent),
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
              if (isTopRank)
                const Icon(
                  Icons.emoji_events,
                  color: AppColors.warning,
                  size: 16,
                ),
            ],
          ),
          Text(
            'Lv.${mascot.currentLevel}',
            style: AppTypography.numberEmphasis.copyWith(fontSize: 14),
          ),
          const Spacer(),
          Center(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.pets, color: AppColors.primary, size: 30),
              ),
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
            '다음 레벨까지 ${remainingExp.toInt()} EXP',
            style: AppTypography.caption.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
