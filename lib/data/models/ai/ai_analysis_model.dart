import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/ai/ai_analysis_entity.dart';

part 'ai_analysis_model.freezed.dart';
part 'ai_analysis_model.g.dart';

@freezed
abstract class AiAnalysisModel with _$AiAnalysisModel {
  const factory AiAnalysisModel({
    required String type,
    String? title,
    String? categoryId,
    @Default(false) bool isRecurring,
    String? emotion,
    required String message,
  }) = _AiAnalysisModel;

  factory AiAnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$AiAnalysisModelFromJson(json);

  const AiAnalysisModel._();

  AiAnalysisEntity toEntity() => AiAnalysisEntity(
    type: type,
    title: title,
    categoryId: categoryId,
    isRecurring: isRecurring,
    emotion: emotion,
    message: message,
  );
}
