import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../entities/ai/ai_analysis_entity.dart';
import '../../repositories/ai/ai_repository.dart';
import '../../repositories/category/category_repository.dart';
import '../../entities/mascot/mascot_entity.dart';

/// 채팅 처리 유스케이스
/// AI를 통해 입력을 분석하고 결과를 반환
class ProcessChatUseCase {
  ProcessChatUseCase(this._aiRepository, this._categoryRepository);

  final AIRepository _aiRepository;
  final CategoryRepository _categoryRepository;

  Future<Either<Failure, AiAnalysisEntity>> call(
    String input,
    MascotEntity mascot,
  ) async {
    final result = await _aiRepository.analyzeInput(input, mascot);

    return result.fold((failure) => Left(failure), (entity) async {
      if (entity.type == 'todo' && entity.categoryId != null) {
        final categoriesResult = await _categoryRepository.getCategories();
        return categoriesResult.fold((f) => Right(entity), (categories) {
          try {
            // AI가 반환한 세만틱 카테고리명을 데이터베이스의 실제 카테고리 ID와 매칭
            final category = categories.firstWhere(
              (c) =>
                  c.id.toLowerCase() == entity.categoryId!.toLowerCase() ||
                  c.name.toLowerCase() == entity.categoryId!.toLowerCase(),
            );
            return Right(entity.copyWith(categoryId: category.id));
          } catch (_) {
            return Right(entity);
          }
        });
      }
      return Right(entity);
    });
  }
}
