import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../models/statistics/day_detail_model.dart';
import '../../../models/statistics/habit_stat_model.dart';
import '../../../models/statistics/heatmap_data_model.dart';
import '../../../models/statistics/hourly_stat_model.dart';
import '../../../models/statistics/mascot_growth_stat_model.dart';
import '../../../models/statistics/weekly_comparison_model.dart';

class StatisticsRemoteDataSource {
  final SupabaseClient _client;

  const StatisticsRemoteDataSource(this._client);

  Future<List<HeatmapDataModel>> getHeatmapData({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final response = await _client.rpc(
      'get_heatmap_data',
      params: {
        'p_user_id': userId,
        'p_start_date': startDate.toIso8601String().split('T')[0],
        'p_end_date': endDate.toIso8601String().split('T')[0],
      },
    );
    return (response as List).map((e) => HeatmapDataModel.fromJson(e)).toList();
  }

  Future<List<HourlyStatModel>> getHourlyStats({
    required String userId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final response = await _client.rpc(
      'get_hourly_stats',
      params: {
        'p_user_id': userId,
        'p_start_date': startDate?.toIso8601String().split('T')[0],
        'p_end_date': endDate?.toIso8601String().split('T')[0],
      },
    );
    return (response as List).map((e) => HourlyStatModel.fromJson(e)).toList();
  }

  Future<List<HabitStatModel>> getHabitStats({
    required String userId,
    required DateTime weekStart,
  }) async {
    final response = await _client.rpc(
      'get_habit_stats',
      params: {
        'p_user_id': userId,
        'p_week_start': weekStart.toIso8601String().split('T')[0],
      },
    );
    return (response as List).map((e) => HabitStatModel.fromJson(e)).toList();
  }

  Future<List<DayDetailModel>> getDayDetail({
    required String userId,
    required DateTime date,
  }) async {
    final response = await _client.rpc(
      'get_day_detail',
      params: {
        'p_user_id': userId,
        'p_date': date.toIso8601String().split('T')[0],
      },
    );
    return (response as List).map((e) => DayDetailModel.fromJson(e)).toList();
  }

  Future<List<MascotGrowthStatModel>> getMascotGrowthStats({
    required String userId,
  }) async {
    final response = await _client.rpc(
      'get_mascot_growth_stats',
      params: {'p_user_id': userId},
    );
    return (response as List)
        .map((e) => MascotGrowthStatModel.fromJson(e))
        .toList();
  }

  Future<WeeklyComparisonModel> getWeeklyComparison({
    required String userId,
  }) async {
    final response = await _client.rpc(
      'get_weekly_comparison',
      params: {'p_user_id': userId},
    );
    if (response is List && response.isNotEmpty) {
      return WeeklyComparisonModel.fromJson(response.first);
    }
    return WeeklyComparisonModel.fromJson(response);
  }
}
