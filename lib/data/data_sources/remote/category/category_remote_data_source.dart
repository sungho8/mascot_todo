import 'package:logger/logger.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../models/category/category_model.dart';

/// Category Remote DataSource 인터페이스
abstract class CategoryRemoteDataSource {
  /// 카테고리 목록 조회 (sort_order 정렬)
  Future<List<CategoryModel>> getCategories();

  /// 특정 카테고리 조회
  Future<CategoryModel> getCategoryById(String categoryId);
}

/// Category Remote DataSource 구현체
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Logger _logger = Logger();

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      _logger.d('카테고리 목록 조회');

      final response = await SupabaseService.client
          .from('categories')
          .select()
          .order('sort_order', ascending: true);

      final categories = (response as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();

      _logger.i('✅ 카테고리 목록 조회 완료: ${categories.length}개');
      return categories;
    } catch (e, stackTrace) {
      _logger.e('카테고리 목록 조회 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<CategoryModel> getCategoryById(String categoryId) async {
    try {
      _logger.d('카테고리 조회: id=$categoryId');

      final response = await SupabaseService.client
          .from('categories')
          .select()
          .eq('id', categoryId)
          .single();

      final category = CategoryModel.fromJson(response);
      _logger.i('✅ 카테고리 조회 완료: ${category.name}');
      return category;
    } catch (e, stackTrace) {
      _logger.e('카테고리 조회 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
