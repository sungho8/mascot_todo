// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mascot_growth_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MascotGrowthStatModelImpl _$$MascotGrowthStatModelImplFromJson(
  Map<String, dynamic> json,
) => _$MascotGrowthStatModelImpl(
  mascotId: json['mascot_id'] as String,
  mascotName: json['mascot_name'] as String,
  currentLevel: (json['current_level'] as num).toInt(),
  currentExp: (json['current_exp'] as num).toDouble(),
  maxExp: (json['max_exp'] as num).toInt(),
  linkedTodoCount: (json['linked_todo_count'] as num).toInt(),
  isUnlocked: json['is_unlocked'] as bool,
);

Map<String, dynamic> _$$MascotGrowthStatModelImplToJson(
  _$MascotGrowthStatModelImpl instance,
) => <String, dynamic>{
  'mascot_id': instance.mascotId,
  'mascot_name': instance.mascotName,
  'current_level': instance.currentLevel,
  'current_exp': instance.currentExp,
  'max_exp': instance.maxExp,
  'linked_todo_count': instance.linkedTodoCount,
  'is_unlocked': instance.isUnlocked,
};
