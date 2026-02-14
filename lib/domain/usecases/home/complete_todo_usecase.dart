import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/todo/todo_entity.dart';
import '../../repositories/todo/todo_repository.dart';

/// Todo 완료 처리 UseCase
class CompleteTodoUseCase {
  final TodoRepository _todoRepository;

  CompleteTodoUseCase(this._todoRepository);

  Future<Either<Failure, TodoEntity>> call(String todoId) async {
    return await _todoRepository.completeTodo(todoId);
  }
}
