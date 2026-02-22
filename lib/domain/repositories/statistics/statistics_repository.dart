import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/statistics/heatmap_data_entity.dart';
import '../../entities/statistics/hourly_stat_entity.dart';
import '../../entities/statistics/habit_stat_entity.dart';
import '../../entities/statistics/day_detail_entity.dart';
import '../../entities/statistics/mascot_growth_stat_entity.dart';
import '../../entities/statistics/weekly_comparison_entity.dart';

abstract class StatisticsRepository {
  Future<Either<Failure, List<HeatmapDataEntity>>> getHeatmapData({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<Either<Failure, List<HourlyStatEntity>>> getHourlyStats({
    required String userId,
    DateTime? startDate,
    DateTime? endDate,
  });

  Future<Either<Failure, List<HabitStatEntity>>> getHabitStats({
    required String userId,
    required DateTime weekStart,
  });

  Future<Either<Failure, List<DayDetailEntity>>> getDayDetail({
    required String userId,
    required DateTime date,
  });

  Future<Either<Failure, List<MascotGrowthStatEntity>>> getMascotGrowthStats({
    required String userId,
  });

  Future<Either<Failure, WeeklyComparisonEntity>> getWeeklyComparison({
    required String userId,
  });
}
