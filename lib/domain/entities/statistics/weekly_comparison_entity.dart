import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_comparison_entity.freezed.dart';

@freezed
abstract class WeeklyComparisonEntity with _$WeeklyComparisonEntity {
  const factory WeeklyComparisonEntity({
    required int thisWeekCount,
    required int lastWeekCount,
    required double changePercent,
  }) = _WeeklyComparisonEntity;
}
