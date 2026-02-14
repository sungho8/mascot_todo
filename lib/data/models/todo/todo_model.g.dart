// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      linkedMascotId: json['linkedMascotId'] as String?,
      categoryId: json['categoryId'] as String?,
      targetDate: json['targetDate'] as String,
      createdAt: json['createdAt'] as String,
      completedAt: json['completedAt'] as String?,
      isFocusTask: json['isFocusTask'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'linkedMascotId': instance.linkedMascotId,
      'categoryId': instance.categoryId,
      'targetDate': instance.targetDate,
      'createdAt': instance.createdAt,
      'completedAt': instance.completedAt,
      'isFocusTask': instance.isFocusTask,
    };
