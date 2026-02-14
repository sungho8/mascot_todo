// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mascot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MascotModelImpl _$$MascotModelImplFromJson(Map<String, dynamic> json) =>
    _$MascotModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      level: (json['level'] as num).toInt(),
      currentExp: (json['currentExp'] as num).toDouble(),
      maxExp: (json['maxExp'] as num).toDouble(),
      isLocked: json['isLocked'] as bool,
      unlockCondition: json['unlockCondition'] as String?,
    );

Map<String, dynamic> _$$MascotModelImplToJson(_$MascotModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'level': instance.level,
      'currentExp': instance.currentExp,
      'maxExp': instance.maxExp,
      'isLocked': instance.isLocked,
      'unlockCondition': instance.unlockCondition,
    };
