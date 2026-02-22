import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../repositories/todo/todo_repository.dart';

/// Todo 삭제 UseCase
class DeleteTodoUseCase {
  final TodoRepository _todoRepository;

  DeleteTodoUseCase(this._todoRepository);

  Future<Either<Failure, void>> call(String todoId) async {
    return await _todoRepository.deleteTodo(todoId);
  }
}
