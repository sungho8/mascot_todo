import 'package:logger/logger.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../models/todo/todo_model.dart';

/// Todo Remote DataSource 인터페이스
abstract class TodoRemoteDataSource {
  /// 오늘 날짜 기준 Todo 목록 조회
  Future<List<TodoModel>> getTodos();

  /// 오늘의 집중 과제 조회
  Future<TodoModel?> getFocusTodo();

  /// Todo 생성
  Future<TodoModel> createTodo({
    required String title,
    String? description,
    bool isFocus = false,
    String? categoryId,
  });

  /// Todo 완료 상태 토글
  Future<TodoModel> completeTodo(String todoId);

  /// Todo 삭제
  Future<void> deleteTodo(String todoId);
}

/// Todo Remote DataSource 구현체
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final Logger _logger = Logger();

  String get _today {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  String get _currentUserId {
    final user = SupabaseService.currentUser;
    if (user == null) throw Exception('로그인이 필요합니다');
    return user.id;
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final userId = _currentUserId;
      _logger.d('Todo 목록 조회: userId=$userId, date=$_today');

      final response = await SupabaseService.client
          .from('todos')
          .select()
          .eq('user_id', userId)
          .eq('target_date', _today)
          .order('created_at', ascending: true);

      final todos = (response as List)
          .map((json) => TodoModel.fromJson(json))
          .toList();

      _logger.i('✅ Todo 목록 조회 완료: ${todos.length}개');
      return todos;
    } catch (e, stackTrace) {
      _logger.e('Todo 목록 조회 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<TodoModel?> getFocusTodo() async {
    try {
      final userId = _currentUserId;

      final response = await SupabaseService.client
          .from('todos')
          .select()
          .eq('user_id', userId)
          .eq('target_date', _today)
          .eq('is_focus', true)
          .eq('is_completed', false)
          .limit(1);

      final list = response as List;
      if (list.isEmpty) return null;

      return TodoModel.fromJson(list.first as Map<String, dynamic>);
    } catch (e, stackTrace) {
      _logger.e('집중 과제 조회 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<TodoModel> createTodo({
    required String title,
    String? description,
    bool isFocus = false,
    String? categoryId,
  }) async {
    try {
      final userId = _currentUserId;
      _logger.d('Todo 생성: title=$title');

      final response = await SupabaseService.client
          .from('todos')
          .insert({
            'user_id': userId,
            'title': title,
            'description': description,
            'is_completed': false,
            'is_focus': isFocus,
            'target_date': _today,
            if (categoryId != null) 'category_id': categoryId,
          })
          .select()
          .single();

      final todo = TodoModel.fromJson(response);
      _logger.i('✅ Todo 생성 완료: ${todo.id}');
      return todo;
    } catch (e, stackTrace) {
      _logger.e('Todo 생성 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<TodoModel> completeTodo(String todoId) async {
    try {
      // 현재 상태 조회
      final current = await SupabaseService.client
          .from('todos')
          .select()
          .eq('id', todoId)
          .single();

      final currentModel = TodoModel.fromJson(current);
      final newIsCompleted = !currentModel.isCompleted;

      _logger.d('Todo 완료 토글: id=$todoId, isCompleted=$newIsCompleted');

      final response = await SupabaseService.client
          .from('todos')
          .update({
            'is_completed': newIsCompleted,
            'completed_at':
                newIsCompleted ? DateTime.now().toIso8601String() : null,
          })
          .eq('id', todoId)
          .select()
          .single();

      final todo = TodoModel.fromJson(response);
      _logger.i('✅ Todo 완료 토글 완료: id=$todoId');
      return todo;
    } catch (e, stackTrace) {
      _logger.e('Todo 완료 처리 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    try {
      _logger.d('Todo 삭제: id=$todoId');

      await SupabaseService.client.from('todos').delete().eq('id', todoId);

      _logger.i('✅ Todo 삭제 완료: id=$todoId');
    } catch (e, stackTrace) {
      _logger.e('Todo 삭제 실패', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
