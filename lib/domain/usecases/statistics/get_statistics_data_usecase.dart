import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/statistics/habit_stat_entity.dart';
import '../../entities/statistics/heatmap_data_entity.dart';
import '../../entities/statistics/hourly_stat_entity.dart';
import '../../entities/statistics/mascot_growth_stat_entity.dart';
import '../../entities/statistics/weekly_comparison_entity.dart';
import '../../repositories/statistics/statistics_repository.dart';

typedef StatisticsDataResult = ({
  List<HeatmapDataEntity> heatmapData,
  List<HourlyStatEntity> hourlyStats,
  List<HabitStatEntity> habitStats,
  List<MascotGrowthStatEntity> mascotGrowthStats,
  WeeklyComparisonEntity weeklyComparison,
});

class GetStatisticsDataUseCase {
  final StatisticsRepository _repository;

  const GetStatisticsDataUseCase(this._repository);

  Future<Either<Failure, StatisticsDataResult>> call({
    required String userId,
    required DateTime heatmapStart,
    required DateTime heatmapEnd,
    required DateTime habitWeekStart,
    DateTime? hourlyStart,
    DateTime? hourlyEnd,
  }) async {
    final heatmapRes = await _repository.getHeatmapData(
      userId: userId,
      startDate: heatmapStart,
      endDate: heatmapEnd,
    );
    if (heatmapRes.isLeft()) return left(heatmapRes.getLeft().toNullable()!);
    final heatmapData = heatmapRes.getRight().toNullable()!;

    final hourlyRes = await _repository.getHourlyStats(
      userId: userId,
      startDate: hourlyStart,
      endDate: hourlyEnd,
    );
    if (hourlyRes.isLeft()) return left(hourlyRes.getLeft().toNullable()!);
    final hourlyStats = hourlyRes.getRight().toNullable()!;

    final habitRes = await _repository.getHabitStats(
      userId: userId,
      weekStart: habitWeekStart,
    );
    if (habitRes.isLeft()) return left(habitRes.getLeft().toNullable()!);
    final habitStats = habitRes.getRight().toNullable()!;

    final mascotRes = await _repository.getMascotGrowthStats(userId: userId);
    if (mascotRes.isLeft()) return left(mascotRes.getLeft().toNullable()!);
    final mascotGrowthStats = mascotRes.getRight().toNullable()!;

    final weeklyRes = await _repository.getWeeklyComparison(userId: userId);
    if (weeklyRes.isLeft()) return left(weeklyRes.getLeft().toNullable()!);
    final weeklyComparison = weeklyRes.getRight().toNullable()!;

    return right((
      heatmapData: heatmapData,
      hourlyStats: hourlyStats,
      habitStats: habitStats,
      mascotGrowthStats: mascotGrowthStats,
      weeklyComparison: weeklyComparison,
    ));
  }
}
