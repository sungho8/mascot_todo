import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/category/category_entity.dart';
import '../../../domain/repositories/category/category_repository.dart';
import '../../data_sources/local/category/category_local_data_source.dart';

/// Category Repository 구현체
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource _localDataSource;

  CategoryRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final models = await _localDataSource.getCategories();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(String categoryId) async {
    try {
      final model = await _localDataSource.getCategoryById(categoryId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
