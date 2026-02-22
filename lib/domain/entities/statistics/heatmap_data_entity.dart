import 'package:freezed_annotation/freezed_annotation.dart';

part 'heatmap_data_entity.freezed.dart';

@freezed
abstract class HeatmapDataEntity with _$HeatmapDataEntity {
  const factory HeatmapDataEntity({
    required DateTime completionDate,
    required int completedCount,
  }) = _HeatmapDataEntity;
}
