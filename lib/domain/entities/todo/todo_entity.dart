import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

/// Todo 엔티티
@freezed
abstract class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required String id,
    required String title,
    required bool isCompleted,
    String? linkedMascotId,
    String? categoryId,
    required DateTime targetDate,
    required DateTime createdAt,
    DateTime? completedAt,
    required bool isFocusTask,
  }) = _TodoEntity;
}
