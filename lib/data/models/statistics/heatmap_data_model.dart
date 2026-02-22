import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/statistics/heatmap_data_entity.dart';

part 'heatmap_data_model.freezed.dart';
part 'heatmap_data_model.g.dart';

@freezed
abstract class HeatmapDataModel with _$HeatmapDataModel {
  const factory HeatmapDataModel({
    @JsonKey(name: 'completion_date') required DateTime completionDate,
    @JsonKey(name: 'completed_count') required int completedCount,
  }) = _HeatmapDataModel;

  factory HeatmapDataModel.fromJson(Map<String, dynamic> json) =>
      _$HeatmapDataModelFromJson(json);
}

extension HeatmapDataModelX on HeatmapDataModel {
  HeatmapDataEntity toEntity() {
    return HeatmapDataEntity(
      completionDate: completionDate,
      completedCount: completedCount,
    );
  }
}
