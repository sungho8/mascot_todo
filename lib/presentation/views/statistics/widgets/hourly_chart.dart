import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../viewmodels/statistics/statistics_viewmodel.dart';
import '../../../../domain/entities/statistics/hourly_stat_entity.dart';

class HourlyChart extends ConsumerWidget {
  const HourlyChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(statisticsViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('시간대별 활동', style: AppTypography.h3),

        AppSpacing.vSm,

        Container(
          padding: AppSpacing.cardPadding,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: AppRadius.card,
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: state.hourlyStats.isEmpty
                    ? const Center(
                        child: Text(
                          '데이터가 없습니다',
                          style: AppTypography.subtitle2,
                        ),
                      )
                    : BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: _getMaxY(state.hourlyStats),
                          barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  if (value % 6 == 0) {
                                    return Text(
                                      '${value.toInt()}시',
                                      style: AppTypography.label,
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                                reservedSize: 22,
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                          barGroups: _createBarGroups(state.hourlyStats),
                        ),
                      ),
              ),

              AppSpacing.vLg,

              _buildInsights(state),
            ],
          ),
        ),
      ],
    );
  }

  double _getMaxY(List<HourlyStatEntity> stats) {
    if (stats.isEmpty) return 10;
    double max = 0;
    for (final s in stats) {
      if (s.completedCount > max) max = s.completedCount.toDouble();
    }
    return max * 1.2;
  }

  List<BarChartGroupData> _createBarGroups(List<HourlyStatEntity> stats) {
    int maxCount = 0;
    for (final s in stats) {
      if (s.completedCount > maxCount) maxCount = s.completedCount;
    }

    return List.generate(24, (index) {
      final stat = stats.cast<HourlyStatEntity?>().firstWhere(
        (s) => s?.hourOfDay == index,
        orElse: () => null,
      );
      final count = stat?.completedCount ?? 0;
      final isPeak = count > 0 && count == maxCount;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: count.toDouble(),
            color: isPeak
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.3),
            width: 8,
            borderRadius: AppRadius.topOnly(4),
          ),
        ],
      );
    });
  }

  Widget _buildInsights(dynamic state) {
    if (state.hourlyStats.isEmpty) return const SizedBox.shrink();

    int peakHour = 0;
    int maxCount = 0;
    for (final stat in state.hourlyStats) {
      if (stat.completedCount > maxCount) {
        maxCount = stat.completedCount;
        peakHour = stat.hourOfDay;
      }
    }

    final comparison = state.weeklyComparison;
    String insightText = '이번 주는 지난 주와 동일하게 활동했어요!';
    if (comparison != null) {
      if (comparison.changePercent > 0) {
        insightText =
            '이번 주는 지난 주보다 ${comparison.changePercent.toStringAsFixed(0)}% 더 완료했어요!';
      } else if (comparison.changePercent < 0) {
        insightText =
            '이번 주는 지난 주보다 ${(-comparison.changePercent).toStringAsFixed(0)}% 덜 완료했어요.';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.insights, color: AppColors.primary, size: 20),

            AppSpacing.hSm,

            Expanded(
              child: Text(
                '당신은 $peakHour시에 가장 활동적이에요!',
                style: AppTypography.subtitle1,
              ),
            ),
          ],
        ),

        AppSpacing.vXs,

        Padding(
          padding: AppSpacing.only(left: 28),
          child: Text(insightText, style: AppTypography.body2),
        ),
      ],
    );
  }
}
