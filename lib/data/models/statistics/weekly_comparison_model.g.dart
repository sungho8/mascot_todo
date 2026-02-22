// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_comparison_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyComparisonModelImpl _$$WeeklyComparisonModelImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyComparisonModelImpl(
  thisWeekCount: (json['this_week_count'] as num).toInt(),
  lastWeekCount: (json['last_week_count'] as num).toInt(),
  changePercent: (json['change_percent'] as num).toDouble(),
);

Map<String, dynamic> _$$WeeklyComparisonModelImplToJson(
  _$WeeklyComparisonModelImpl instance,
) => <String, dynamic>{
  'this_week_count': instance.thisWeekCount,
  'last_week_count': instance.lastWeekCount,
  'change_percent': instance.changePercent,
};
