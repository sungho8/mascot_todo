import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/todo/todo_entity.dart';

/// Todo Repository 인터페이스
abstract class TodoRepository {
  /// Todo 목록 조회
  Future<Either<Failure, List<TodoEntity>>> getTodos();

  /// 오늘의 집중 과제 조회
  Future<Either<Failure, TodoEntity?>> getFocusTodo();

  /// Todo 생성
  Future<Either<Failure, TodoEntity>> createTodo(TodoEntity todo);

  /// Todo 완료 처리
  Future<Either<Failure, TodoEntity>> completeTodo(String todoId);

  /// Todo 수정
  Future<Either<Failure, TodoEntity>> updateTodo({
    required String todoId,
    required String title,
    String? description,
    bool? isFocus,
    bool? isRecurring,
    String? categoryId,
  });

  /// Todo 삭제
  Future<Either<Failure, void>> deleteTodo(String todoId);
}
