import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../viewmodels/statistics/statistics_viewmodel.dart';
import '../../../../domain/entities/statistics/habit_stat_entity.dart';

class HabitTracker extends ConsumerWidget {
  const HabitTracker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(statisticsViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('습관 트래커', style: AppTypography.h3),

        AppSpacing.vSm,

        if (state.habitStats.isEmpty)
          Container(
            width: double.infinity,
            padding: AppSpacing.screenAll,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: AppRadius.card,
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color: AppColors.textDisabled,
                  size: 40,
                ),

                AppSpacing.vSm,

                const Text('아직 반복 할 일이 없어요', style: AppTypography.subtitle2),
              ],
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _getUniqueHabits(state.habitStats).length,
            separatorBuilder: (_, __) => AppSpacing.vSm,
            itemBuilder: (context, index) {
              final habitId = _getUniqueHabits(state.habitStats)[index];
              final statsForHabit = state.habitStats
                  .where((s) => s.recurringSourceId == habitId)
                  .toList();
              final title = statsForHabit.first.habitTitle;
              final completed = statsForHabit
                  .where((s) => s.isCompleted)
                  .length;
              final total = statsForHabit.length;
              final progress = total > 0 ? completed / total : 0.0;

              return Container(
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
                        Text(title, style: AppTypography.subtitle1),

                        Text(
                          '$completed/$total 완료',
                          style: AppTypography.caption,
                        ),
                      ],
                    ),

                    AppSpacing.vSm,

                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppColors.backgroundSecondary,
                      color: AppColors.primary,
                      borderRadius: AppRadius.button,
                    ),

                    AppSpacing.vMd,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(7, (dayIndex) {
                        // For PostgreSQL, DOW is usually 0(Sun) or 1-7. Let's assume weekday 1 is Monday ... 7 is Sunday.
                        // Wait, Postgres EXTRACT(ISODOW) returns 1 (Monday) to 7 (Sunday).
                        // Let's assume DOW fits 1..7
                        final stat = statsForHabit
                            .cast<HabitStatEntity?>()
                            .firstWhere(
                              (s) => s!.dayOfWeek == dayIndex + 1,
                              orElse: () => null,
                            );

                        final isDone = stat?.isCompleted ?? false;
                        final dayNames = ['월', '화', '수', '목', '금', '토', '일'];

                        return Column(
                          children: [
                            Text(
                              dayNames[dayIndex],
                              style: AppTypography.caption,
                            ),

                            AppSpacing.vXs,

                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDone
                                    ? AppColors.primary
                                    : Colors.transparent,
                                border: Border.all(
                                  color: isDone
                                      ? AppColors.primary
                                      : AppColors.border,
                                ),
                              ),
                              child: isDone
                                  ? const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: AppColors.textOnDark,
                                    )
                                  : null,
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }

  List<String> _getUniqueHabits(List<HabitStatEntity> stats) {
    return stats.map((s) => s.recurringSourceId).toSet().toList();
  }
}
