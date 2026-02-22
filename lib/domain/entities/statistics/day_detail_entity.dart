import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_detail_entity.freezed.dart';

@freezed
abstract class DayDetailEntity with _$DayDetailEntity {
  const factory DayDetailEntity({
    required String todoId,
    required String title,
    required String categoryName,
    required String categoryColor,
    DateTime? completedAt,
    String? linkedMascotId,
  }) = _DayDetailEntity;
}
