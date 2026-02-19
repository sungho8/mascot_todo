// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      isCompleted: json['is_completed'] as bool,
      isFocus: json['is_focus'] as bool? ?? false,
      linkedMascotId: json['linked_mascot_id'] as String?,
      categoryId: json['category_id'] as String?,
      targetDate: json['target_date'] as String,
      completedAt: json['completed_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'is_completed': instance.isCompleted,
      'is_focus': instance.isFocus,
      'linked_mascot_id': instance.linkedMascotId,
      'category_id': instance.categoryId,
      'target_date': instance.targetDate,
      'completed_at': instance.completedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
