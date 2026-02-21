// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiAnalysisModelImpl _$$AiAnalysisModelImplFromJson(
  Map<String, dynamic> json,
) => _$AiAnalysisModelImpl(
  type: json['type'] as String,
  title: json['title'] as String?,
  categoryId: json['categoryId'] as String?,
  message: json['message'] as String,
);

Map<String, dynamic> _$$AiAnalysisModelImplToJson(
  _$AiAnalysisModelImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'categoryId': instance.categoryId,
  'message': instance.message,
};
