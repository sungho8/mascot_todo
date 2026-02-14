import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/todo/todo_entity.dart';
import '../../../domain/repositories/todo/todo_repository.dart';
import '../../data_sources/local/todo/todo_local_data_source.dart';

/// Todo Repository 구현체
class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource _localDataSource;

  TodoRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() async {
    try {
      final models = await _localDataSource.getTodos();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoEntity?>> getFocusTodo() async {
    try {
      final model = await _localDataSource.getFocusTodo();
      return Right(model?.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> createTodo(TodoEntity todo) async {
    try {
      // 임시 구현
      return Right(todo);
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> completeTodo(String todoId) async {
    try {
      final model = await _localDataSource.completeTodo(todoId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String todoId) async {
    try {
      // 임시 구현
      return const Right(null);
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
