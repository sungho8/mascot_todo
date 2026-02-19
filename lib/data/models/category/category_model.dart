// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/category/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

/// 카테고리 모델
@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    required String id,
    required String name,
    @JsonKey(name: 'color_hex') required String colorHex,
    @JsonKey(name: 'icon_name') String? iconName,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// Model -> Entity 변환
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      colorHex: colorHex,
      iconName: iconName,
    );
  }
}
