// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profileImagePath: json['profileImagePath'] as String?,
      level: (json['level'] as num).toInt(),
      currentExp: (json['currentExp'] as num).toDouble(),
      maxExp: (json['maxExp'] as num).toDouble(),
      totalCompleted: (json['totalCompleted'] as num).toInt(),
      currentStreak: (json['currentStreak'] as num).toInt(),
      earlyBirdCount: (json['earlyBirdCount'] as num?)?.toInt() ?? 0,
      dailyMaxCompleted: (json['dailyMaxCompleted'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImagePath': instance.profileImagePath,
      'level': instance.level,
      'currentExp': instance.currentExp,
      'maxExp': instance.maxExp,
      'totalCompleted': instance.totalCompleted,
      'currentStreak': instance.currentStreak,
      'earlyBirdCount': instance.earlyBirdCount,
      'dailyMaxCompleted': instance.dailyMaxCompleted,
    };
