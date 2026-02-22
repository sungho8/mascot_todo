import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_analysis_entity.freezed.dart';

@freezed
abstract class AiAnalysisEntity with _$AiAnalysisEntity {
  const factory AiAnalysisEntity({
    required String type,
    String? title,
    String? categoryId, // 시맨틱 카테고리 (health, work 등)
    @Default(false) bool isRecurring,
    String? emotion, // 감정 상태 (happy, sad, neutral)
    required String message,
  }) = _AiAnalysisEntity;
}
