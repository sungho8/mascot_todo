import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/home/get_home_data_usecase.dart';
import '../../../domain/usecases/home/complete_todo_usecase.dart';
import '../../../domain/usecases/home/create_todo_usecase.dart';
import '../../../di/home/home_providers.dart';
import 'home_state.dart';

part 'home_viewmodel.g.dart';

/// 홈 화면 ViewModel
@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final GetHomeDataUseCase _getHomeDataUseCase;
  late final CompleteTodoUseCase _completeTodoUseCase;
  late final CreateTodoUseCase _createTodoUseCase;

  @override
  HomeState build() {
    _getHomeDataUseCase = ref.read(getHomeDataUseCaseProvider);
    _completeTodoUseCase = ref.read(completeTodoUseCaseProvider);
    _createTodoUseCase = ref.read(createTodoUseCaseProvider);

    // 초기 데이터 로드 (다음 프레임에서 실행)
    Future.microtask(() => loadHomeData());

    return const HomeState();
  }

  /// 홈 화면 데이터 로드
  Future<void> loadHomeData() async {
    state = state.copyWith(status: HomeStatus.loading);

    final result = await _getHomeDataUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(
          status: HomeStatus.error,
          errorMessage: failure.when(
            serverError: (msg) => msg ?? '서버 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '데이터를 불러올 수 없습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
      },
      (homeData) {
        state = state.copyWith(
          status: HomeStatus.loaded,
          user: homeData.user,
          todos: homeData.todos,
          focusTodo: homeData.focusTodo,
          mainMascot: homeData.mainMascot,
          categories: homeData.categories,
          errorMessage: null,
        );
      },
    );
  }

  /// Todo 생성
  Future<bool> createTodo({
    required String title,
    String? description,
    bool isFocus = false,
    String? categoryId,
  }) async {
    final result = await _createTodoUseCase(
      title: title,
      description: description,
      isFocus: isFocus,
      categoryId: categoryId,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: failure.when(
            serverError: (msg) => msg ?? 'Todo 생성 중 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '데이터를 저장할 수 없습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
        return false;
      },
      (newTodo) {
        state = state.copyWith(
          todos: [...state.todos, newTodo],
          errorMessage: null,
        );
        return true;
      },
    );
  }

  /// Todo 완료 처리
  Future<void> completeTodo(String todoId) async {
    final result = await _completeTodoUseCase(todoId);

    result.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: failure.when(
            serverError: (msg) => msg ?? 'Todo 완료 처리 중 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '데이터를 저장할 수 없습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
      },
      (completedTodo) {
        // Todo 목록 업데이트
        final updatedTodos = state.todos.map((todo) {
          return todo.id == todoId ? completedTodo : todo;
        }).toList();

        state = state.copyWith(todos: updatedTodos, errorMessage: null);
      },
    );
  }
}
