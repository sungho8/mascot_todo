import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/todo/todo_entity.dart';
import '../../../domain/repositories/todo/todo_repository.dart';
import '../../data_sources/remote/todo/todo_remote_data_source.dart';

/// Todo Repository 구현체
class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource _remoteDataSource;

  TodoRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() async {
    try {
      final models = await _remoteDataSource.getTodos();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoEntity?>> getFocusTodo() async {
    try {
      final model = await _remoteDataSource.getFocusTodo();
      return Right(model?.toEntity());
    } catch (e) {
      return Left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> createTodo(TodoEntity todo) async {
    try {
      final model = await _remoteDataSource.createTodo(
        title: todo.title,
        description: todo.description,
        isFocus: todo.isFocusTask,
        isRecurring: todo.isRecurring,
        categoryId: todo.categoryId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> completeTodo(String todoId) async {
    try {
      final model = await _remoteDataSource.completeTodo(todoId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> updateTodo({
    required String todoId,
    required String title,
    String? description,
    bool? isFocus,
    bool? isRecurring,
    String? categoryId,
  }) async {
    try {
      final model = await _remoteDataSource.updateTodo(
        todoId: todoId,
        title: title,
        description: description,
        isFocus: isFocus,
        isRecurring: isRecurring,
        categoryId: categoryId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String todoId) async {
    try {
      await _remoteDataSource.deleteTodo(todoId);
      return const Right(null);
    } catch (e) {
      return Left(Failure.serverError(message: e.toString()));
    }
  }
}
