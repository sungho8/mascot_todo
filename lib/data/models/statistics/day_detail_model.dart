import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/statistics/day_detail_entity.dart';

part 'day_detail_model.freezed.dart';
part 'day_detail_model.g.dart';

@freezed
abstract class DayDetailModel with _$DayDetailModel {
  const factory DayDetailModel({
    @JsonKey(name: 'todo_id') required String todoId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'category_color') required String categoryColor,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'linked_mascot_id') String? linkedMascotId,
  }) = _DayDetailModel;

  factory DayDetailModel.fromJson(Map<String, dynamic> json) =>
      _$DayDetailModelFromJson(json);
}

extension DayDetailModelX on DayDetailModel {
  DayDetailEntity toEntity() {
    return DayDetailEntity(
      todoId: todoId,
      title: title,
      categoryName: categoryName,
      categoryColor: categoryColor,
      completedAt: completedAt,
      linkedMascotId: linkedMascotId,
    );
  }
}
