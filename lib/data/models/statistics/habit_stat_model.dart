import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/statistics/habit_stat_entity.dart';

part 'habit_stat_model.freezed.dart';
part 'habit_stat_model.g.dart';

@freezed
abstract class HabitStatModel with _$HabitStatModel {
  const factory HabitStatModel({
    @JsonKey(name: 'recurring_source_id') required String recurringSourceId,
    @JsonKey(name: 'habit_title') required String habitTitle,
    @JsonKey(name: 'day_of_week') required int dayOfWeek,
    @JsonKey(name: 'is_completed') required bool isCompleted,
  }) = _HabitStatModel;

  factory HabitStatModel.fromJson(Map<String, dynamic> json) =>
      _$HabitStatModelFromJson(json);
}

extension HabitStatModelX on HabitStatModel {
  HabitStatEntity toEntity() {
    return HabitStatEntity(
      recurringSourceId: recurringSourceId,
      habitTitle: habitTitle,
      dayOfWeek: dayOfWeek,
      isCompleted: isCompleted,
    );
  }
}
