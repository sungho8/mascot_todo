import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../core/services/ai_service.dart';
import '../../../domain/entities/ai/ai_analysis_entity.dart';
import '../../../domain/repositories/ai/ai_repository.dart';

/// AI 저장소 구현체
class AIRepositoryImpl implements AIRepository {
  AIRepositoryImpl(this._aiService);

  final AIService _aiService;

  @override
  Future<Either<Failure, AiAnalysisEntity>> analyzeInput(
    String input,
    String mascotName,
  ) async {
    try {
      final model = await _aiService.analyzeInput(input, mascotName);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
