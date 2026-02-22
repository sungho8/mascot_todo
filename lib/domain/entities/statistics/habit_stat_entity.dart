import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_stat_entity.freezed.dart';

@freezed
abstract class HabitStatEntity with _$HabitStatEntity {
  const factory HabitStatEntity({
    required String recurringSourceId,
    required String habitTitle,
    required int dayOfWeek,
    required bool isCompleted,
  }) = _HabitStatEntity;
}
