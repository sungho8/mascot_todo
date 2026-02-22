// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HourlyStatModelImpl _$$HourlyStatModelImplFromJson(
  Map<String, dynamic> json,
) => _$HourlyStatModelImpl(
  hourOfDay: (json['hour_of_day'] as num).toInt(),
  completedCount: (json['completed_count'] as num).toInt(),
);

Map<String, dynamic> _$$HourlyStatModelImplToJson(
  _$HourlyStatModelImpl instance,
) => <String, dynamic>{
  'hour_of_day': instance.hourOfDay,
  'completed_count': instance.completedCount,
};
