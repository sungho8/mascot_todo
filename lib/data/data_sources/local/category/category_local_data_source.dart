import '../../../models/category/category_model.dart';

/// Category Local DataSource
class CategoryLocalDataSource {
  /// 더미 카테고리 목록
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      CategoryModel(
        id: '1',
        name: '업무',
        colorHex: 'FF5252',
        iconName: 'work',
      ),
      CategoryModel(
        id: '2',
        name: '운동',
        colorHex: '4CAF50',
        iconName: 'fitness',
      ),
      CategoryModel(
        id: '3',
        name: '공부',
        colorHex: '2196F3',
        iconName: 'school',
      ),
    ];
  }

  /// 특정 카테고리 조회
  Future<CategoryModel> getCategoryById(String categoryId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final categories = await getCategories();
    return categories.firstWhere((c) => c.id == categoryId);
  }
}
