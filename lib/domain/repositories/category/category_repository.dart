import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/category/category_entity.dart';

/// Category Repository 인터페이스
abstract class CategoryRepository {
  /// 카테고리 목록 조회
  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  /// 특정 카테고리 조회
  Future<Either<Failure, CategoryEntity>> getCategoryById(String categoryId);
}
