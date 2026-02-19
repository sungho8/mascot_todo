import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/todo/todo_entity.dart';
import '../../repositories/todo/todo_repository.dart';

/// Todo 생성 UseCase
class CreateTodoUseCase {
  final TodoRepository _todoRepository;

  CreateTodoUseCase(this._todoRepository);

  Future<Either<Failure, TodoEntity>> call({
    required String title,
    String? description,
    bool isFocus = false,
    String? categoryId,
  }) async {
    final todo = TodoEntity(
      id: '',
      title: title,
      description: description,
      isCompleted: false,
      isFocusTask: isFocus,
      categoryId: categoryId,
      targetDate: DateTime.now(),
      createdAt: DateTime.now(),
    );
    return await _todoRepository.createTodo(todo);
  }
}
