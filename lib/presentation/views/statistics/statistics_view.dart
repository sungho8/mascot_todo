import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/app_spacing.dart';
import '../../../core/design_system/app_typography.dart';
import '../../../core/design_system/app_colors.dart';
import '../../../core/design_system/app_radius.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import 'widgets/summary_cards.dart';
import 'widgets/heatmap_calendar.dart';
import 'widgets/habit_tracker.dart';
import 'widgets/hourly_chart.dart';
import 'widgets/mascot_growth_section.dart';
import '../../viewmodels/statistics/statistics_viewmodel.dart';
import '../../viewmodels/statistics/statistics_state.dart';

/// 통계 화면
class StatisticsView extends ConsumerWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(statisticsViewModelProvider);
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('통계', style: AppTypography.h2),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: _buildBody(state, homeState, ref),
    );
  }

  Widget _buildBody(StatisticsState state, dynamic homeState, WidgetRef ref) {
    if (state.status == StatisticsStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (state.status == StatisticsStatus.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 48),

            AppSpacing.vMd,

            Text(
              state.errorMessage ?? '오류가 발생했습니다',
              style: AppTypography.subtitle1,
            ),

            AppSpacing.vLg,

            ElevatedButton(
              onPressed: () =>
                  ref.read(statisticsViewModelProvider.notifier).loadData(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textOnDark,
                textStyle: AppTypography.buttonMedium,
                padding: AppSpacing.button,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.button,
                ),
              ),
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async =>
          ref.read(statisticsViewModelProvider.notifier).loadData(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: AppSpacing.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (homeState.user != null) ...[
              SummaryCards(user: homeState.user!),

              AppSpacing.vLg,
            ],

            const HeatmapCalendar(),

            const HabitTracker(),

            AppSpacing.vLg,

            const HourlyChart(),

            AppSpacing.vLg,

            const MascotGrowthSection(),

            AppSpacing.vLg,
          ],
        ),
      ),
    );
  }
}
