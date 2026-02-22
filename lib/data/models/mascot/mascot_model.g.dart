// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mascot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MascotModelImpl _$$MascotModelImplFromJson(Map<String, dynamic> json) =>
    _$MascotModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['image_path'] as String,
      level: (json['level'] as num?)?.toInt() ?? 1,
      currentExp: (json['current_exp'] as num?)?.toDouble() ?? 0.0,
      maxExp: (json['max_exp'] as num?)?.toDouble() ?? 100.0,
      unlockConditionType: json['unlock_condition_type'] as String,
      unlockConditionValue: (json['unlock_condition_value'] as num).toInt(),
      unlockDescription: json['unlock_description'] as String,
      isDefault: json['is_default'] as bool,
      isUnlocked: json['is_unlocked'] as bool? ?? false,
    );

Map<String, dynamic> _$$MascotModelImplToJson(_$MascotModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_path': instance.imagePath,
      'level': instance.level,
      'current_exp': instance.currentExp,
      'max_exp': instance.maxExp,
      'unlock_condition_type': instance.unlockConditionType,
      'unlock_condition_value': instance.unlockConditionValue,
      'unlock_description': instance.unlockDescription,
      'is_default': instance.isDefault,
      'is_unlocked': instance.isUnlocked,
    };
