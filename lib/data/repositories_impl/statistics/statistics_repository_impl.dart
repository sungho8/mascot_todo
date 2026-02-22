import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/statistics/day_detail_entity.dart';
import '../../../domain/entities/statistics/habit_stat_entity.dart';
import '../../../domain/entities/statistics/heatmap_data_entity.dart';
import '../../../domain/entities/statistics/hourly_stat_entity.dart';
import '../../../domain/entities/statistics/mascot_growth_stat_entity.dart';
import '../../../domain/entities/statistics/weekly_comparison_entity.dart';
import '../../../domain/repositories/statistics/statistics_repository.dart';
import '../../data_sources/remote/statistics/statistics_remote_data_source.dart';
import '../../models/statistics/day_detail_model.dart';
import '../../models/statistics/habit_stat_model.dart';
import '../../models/statistics/heatmap_data_model.dart';
import '../../models/statistics/hourly_stat_model.dart';
import '../../models/statistics/mascot_growth_stat_model.dart';
import '../../models/statistics/weekly_comparison_model.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  final StatisticsRemoteDataSource _remoteDataSource;

  const StatisticsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<HeatmapDataEntity>>> getHeatmapData({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final models = await _remoteDataSource.getHeatmapData(
        userId: userId,
        startDate: startDate,
        endDate: endDate,
      );
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HourlyStatEntity>>> getHourlyStats({
    required String userId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final models = await _remoteDataSource.getHourlyStats(
        userId: userId,
        startDate: startDate,
        endDate: endDate,
      );
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HabitStatEntity>>> getHabitStats({
    required String userId,
    required DateTime weekStart,
  }) async {
    try {
      final models = await _remoteDataSource.getHabitStats(
        userId: userId,
        weekStart: weekStart,
      );
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DayDetailEntity>>> getDayDetail({
    required String userId,
    required DateTime date,
  }) async {
    try {
      final models = await _remoteDataSource.getDayDetail(
        userId: userId,
        date: date,
      );
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MascotGrowthStatEntity>>> getMascotGrowthStats({
    required String userId,
  }) async {
    try {
      final models = await _remoteDataSource.getMascotGrowthStats(
        userId: userId,
      );
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WeeklyComparisonEntity>> getWeeklyComparison({
    required String userId,
  }) async {
    try {
      final model = await _remoteDataSource.getWeeklyComparison(userId: userId);
      return right(model.toEntity());
    } catch (e) {
      return left(Failure.serverError(message: e.toString()));
    }
  }
}
