// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/todo/todo_entity.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

/// Todo 모델 (Supabase todos 테이블과 매핑)
@freezed
abstract class TodoModel with _$TodoModel {
  const TodoModel._();

  const factory TodoModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String title,
    String? description,
    @JsonKey(name: 'is_completed') required bool isCompleted,
    @JsonKey(name: 'is_focus') @Default(false) bool isFocus,
    @JsonKey(name: 'is_recurring') @Default(false) bool isRecurring,
    @JsonKey(name: 'recurring_source_id') String? recurringSourceId,
    @JsonKey(name: 'linked_mascot_id') String? linkedMascotId,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'target_date') required String targetDate,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  /// Model -> Entity 변환
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      linkedMascotId: linkedMascotId,
      categoryId: categoryId,
      targetDate: DateTime.parse(targetDate),
      createdAt: DateTime.parse(createdAt),
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      isFocusTask: isFocus,
      isRecurring: isRecurring,
      recurringSourceId: recurringSourceId,
    );
  }
}
