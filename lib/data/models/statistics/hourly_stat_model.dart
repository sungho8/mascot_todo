import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/statistics/hourly_stat_entity.dart';

part 'hourly_stat_model.freezed.dart';
part 'hourly_stat_model.g.dart';

@freezed
abstract class HourlyStatModel with _$HourlyStatModel {
  const factory HourlyStatModel({
    @JsonKey(name: 'hour_of_day') required int hourOfDay,
    @JsonKey(name: 'completed_count') required int completedCount,
  }) = _HourlyStatModel;

  factory HourlyStatModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyStatModelFromJson(json);
}

extension HourlyStatModelX on HourlyStatModel {
  HourlyStatEntity toEntity() {
    return HourlyStatEntity(
      hourOfDay: hourOfDay,
      completedCount: completedCount,
    );
  }
}
