// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitStatModelImpl _$$HabitStatModelImplFromJson(Map<String, dynamic> json) =>
    _$HabitStatModelImpl(
      recurringSourceId: json['recurring_source_id'] as String,
      habitTitle: json['habit_title'] as String,
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      isCompleted: json['is_completed'] as bool,
    );

Map<String, dynamic> _$$HabitStatModelImplToJson(
  _$HabitStatModelImpl instance,
) => <String, dynamic>{
  'recurring_source_id': instance.recurringSourceId,
  'habit_title': instance.habitTitle,
  'day_of_week': instance.dayOfWeek,
  'is_completed': instance.isCompleted,
};
