import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/todo/todo_entity.dart';
import '../../repositories/todo/todo_repository.dart';

/// Todo 수정 UseCase
class UpdateTodoUseCase {
  final TodoRepository _todoRepository;

  UpdateTodoUseCase(this._todoRepository);

  Future<Either<Failure, TodoEntity>> call({
    required String todoId,
    required String title,
    String? description,
    bool? isFocus,
    bool? isRecurring,
    String? categoryId,
  }) async {
    return await _todoRepository.updateTodo(
      todoId: todoId,
      title: title,
      description: description,
      isFocus: isFocus,
      isRecurring: isRecurring,
      categoryId: categoryId,
    );
  }
}
