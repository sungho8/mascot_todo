import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/statistics/heatmap_data_entity.dart';
import '../../../../domain/entities/statistics/hourly_stat_entity.dart';
import '../../../../domain/entities/statistics/habit_stat_entity.dart';
import '../../../../domain/entities/statistics/day_detail_entity.dart';
import '../../../../domain/entities/statistics/mascot_growth_stat_entity.dart';
import '../../../../domain/entities/statistics/weekly_comparison_entity.dart';

part 'statistics_state.freezed.dart';

enum StatisticsStatus { initial, loading, loaded, error }

@freezed
abstract class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(StatisticsStatus.initial) StatisticsStatus status,
    @Default([]) List<HeatmapDataEntity> heatmapData,

    @Default([]) List<HourlyStatEntity> hourlyStats,
    @Default([]) List<HabitStatEntity> habitStats,
    @Default([]) List<DayDetailEntity> dayDetails,
    @Default([]) List<MascotGrowthStatEntity> mascotGrowthStats,
    WeeklyComparisonEntity? weeklyComparison,
    DateTime? selectedDate,
    @Default(0) int selectedMonth,

    String? errorMessage,
  }) = _StatisticsState;
}
