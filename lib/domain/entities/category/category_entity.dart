import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

/// TODO 카테고리 엔티티
@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    required String colorHex,
    String? iconName,
  }) = _CategoryEntity;
}
