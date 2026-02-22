import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/statistics/weekly_comparison_entity.dart';

part 'weekly_comparison_model.freezed.dart';
part 'weekly_comparison_model.g.dart';

@freezed
abstract class WeeklyComparisonModel with _$WeeklyComparisonModel {
  const factory WeeklyComparisonModel({
    @JsonKey(name: 'this_week_count') required int thisWeekCount,
    @JsonKey(name: 'last_week_count') required int lastWeekCount,
    // JSON might return int or double for numeric, handle via conversion
    @JsonKey(name: 'change_percent') required double changePercent,
  }) = _WeeklyComparisonModel;

  factory WeeklyComparisonModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyComparisonModelFromJson(json);
}

extension WeeklyComparisonModelX on WeeklyComparisonModel {
  WeeklyComparisonEntity toEntity() {
    return WeeklyComparisonEntity(
      thisWeekCount: thisWeekCount,
      lastWeekCount: lastWeekCount,
      changePercent: changePercent,
    );
  }
}
