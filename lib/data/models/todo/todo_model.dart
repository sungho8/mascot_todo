import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/todo/todo_entity.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

/// Todo 모델
@freezed
abstract class TodoModel with _$TodoModel {
  const TodoModel._();

  const factory TodoModel({
    required String id,
    required String title,
    required bool isCompleted,
    String? linkedMascotId,
    String? categoryId,
    required String targetDate,
    required String createdAt,
    String? completedAt,
    @Default(false) bool isFocusTask,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  /// Model -> Entity 변환
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
      linkedMascotId: linkedMascotId,
      categoryId: categoryId,
      targetDate: DateTime.parse(targetDate),
      createdAt: DateTime.parse(createdAt),
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      isFocusTask: isFocusTask,
    );
  }
}
