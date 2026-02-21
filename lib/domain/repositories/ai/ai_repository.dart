import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../entities/ai/ai_analysis_entity.dart';

/// AI 저장소 인터페이스
abstract class AIRepository {
  /// 사용자 입력을 분석하여 결과 반환
  Future<Either<Failure, AiAnalysisEntity>> analyzeInput(
    String input,
    String mascotName,
  );
}
