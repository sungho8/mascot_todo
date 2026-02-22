// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heatmap_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeatmapDataModelImpl _$$HeatmapDataModelImplFromJson(
  Map<String, dynamic> json,
) => _$HeatmapDataModelImpl(
  completionDate: DateTime.parse(json['completion_date'] as String),
  completedCount: (json['completed_count'] as num).toInt(),
);

Map<String, dynamic> _$$HeatmapDataModelImplToJson(
  _$HeatmapDataModelImpl instance,
) => <String, dynamic>{
  'completion_date': instance.completionDate.toIso8601String(),
  'completed_count': instance.completedCount,
};
