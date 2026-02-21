import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../entities/ai/ai_analysis_entity.dart';
import '../../repositories/ai/ai_repository.dart';
import '../../repositories/category/category_repository.dart';

/// 채팅 처리 유스케이스
/// AI를 통해 입력을 분석하고 결과를 반환하며 카테고리 매핑을 수행
class ProcessChatUseCase {
  ProcessChatUseCase(this._aiRepository, this._categoryRepository);

  final AIRepository _aiRepository;
  final CategoryRepository _categoryRepository;

  Future<Either<Failure, AiAnalysisEntity>> call(
    String input,
    String mascotName,
  ) async {
    final result = await _aiRepository.analyzeInput(input, mascotName);

    return result.fold((failure) async => Left(failure), (analysis) async {
      if (analysis.type == 'todo' && analysis.categoryId != null) {
        // 시맨틱 카테고리명을 실제 UUID로 매핑 시도
        final uuid = await _mapSemanticToUuid(analysis.categoryId!);
        return Right(
          analysis.copyWith(categoryId: uuid ?? analysis.categoryId),
        );
      }
      return Right(analysis);
    });
  }

  /// 시맨틱 카테고리 (health, work 등)를 시스템 UUID로 변환
  Future<String?> _mapSemanticToUuid(String semanticName) async {
    final Map<String, String> mapping = {
      'health': '건강 & 운동',
      'study': '학습',
      'work': '업무',
      'mindfulness': '마음챙김',
      'habit': '생활 습관',
      'hobby': '취미 & 여가',
    };

    final targetName = mapping[semanticName];
    if (targetName == null) return null;

    final categoriesResult = await _categoryRepository.getCategories();
    return categoriesResult.fold((_) => null, (categories) {
      try {
        return categories.firstWhere((c) => c.name == targetName).id;
      } catch (_) {
        return null;
      }
    });
  }
}
