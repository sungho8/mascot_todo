import 'package:freezed_annotation/freezed_annotation.dart';

part 'hourly_stat_entity.freezed.dart';

@freezed
abstract class HourlyStatEntity with _$HourlyStatEntity {
  const factory HourlyStatEntity({
    required int hourOfDay,
    required int completedCount,
  }) = _HourlyStatEntity;
}
