// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayDetailModelImpl _$$DayDetailModelImplFromJson(Map<String, dynamic> json) =>
    _$DayDetailModelImpl(
      todoId: json['todo_id'] as String,
      title: json['title'] as String,
      categoryName: json['category_name'] as String,
      categoryColor: json['category_color'] as String,
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      linkedMascotId: json['linked_mascot_id'] as String?,
    );

Map<String, dynamic> _$$DayDetailModelImplToJson(
  _$DayDetailModelImpl instance,
) => <String, dynamic>{
  'todo_id': instance.todoId,
  'title': instance.title,
  'category_name': instance.categoryName,
  'category_color': instance.categoryColor,
  'completed_at': instance.completedAt?.toIso8601String(),
  'linked_mascot_id': instance.linkedMascotId,
};
