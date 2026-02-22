import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../core/services/ai_service.dart';
import '../../../domain/entities/ai/ai_analysis_entity.dart';
import '../../../domain/repositories/ai/ai_repository.dart';
import '../../../../core/constants/mascot_persona_ext.dart';
import '../../../domain/entities/mascot/mascot_entity.dart';

/// AI 저장소 구현체
class AIRepositoryImpl implements AIRepository {
  AIRepositoryImpl(this._aiService);

  final AIService _aiService;

  @override
  Future<Either<Failure, AiAnalysisEntity>> analyzeInput(
    String input,
    MascotEntity mascot,
  ) async {
    try {
      final model = await _aiService.analyzeInput(input, mascot.systemPrompt);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
