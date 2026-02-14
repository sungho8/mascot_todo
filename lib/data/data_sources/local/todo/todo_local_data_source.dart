import '../../../models/todo/todo_model.dart';

/// Todo Local DataSource
class TodoLocalDataSource {
  /// 더미 Todo 목록
  Future<List<TodoModel>> getTodos() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      TodoModel(
        id: '1',
        title: '프로젝트 기획서 작성',
        isCompleted: false,
        linkedMascotId: '1',
        categoryId: '1',
        targetDate: DateTime.now().toIso8601String(),
        createdAt: DateTime.now().toIso8601String(),
        isFocusTask: true,
      ),
      TodoModel(
        id: '2',
        title: '운동하기',
        isCompleted: false,
        linkedMascotId: '2',
        categoryId: '2',
        targetDate: DateTime.now().toIso8601String(),
        createdAt: DateTime.now().toIso8601String(),
        isFocusTask: false,
      ),
      TodoModel(
        id: '3',
        title: '책 읽기',
        isCompleted: true,
        linkedMascotId: '1',
        categoryId: '3',
        targetDate: DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
        createdAt: DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
        completedAt: DateTime.now().toIso8601String(),
        isFocusTask: false,
      ),
    ];
  }

  /// 집중 과제 조회
  Future<TodoModel?> getFocusTodo() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final todos = await getTodos();
    return todos.where((todo) => todo.isFocusTask && !todo.isCompleted).firstOrNull;
  }

  /// Todo 완료 상태 토글 (완료 ↔ 미완료)
  Future<TodoModel> completeTodo(String todoId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final todos = await getTodos();
    final todo = todos.firstWhere((t) => t.id == todoId);

    // 현재 완료 상태의 반대로 토글
    final newCompletionStatus = !todo.isCompleted;

    return todo.copyWith(
      isCompleted: newCompletionStatus,
      completedAt: newCompletionStatus ? DateTime.now().toIso8601String() : null,
    );
  }
}
