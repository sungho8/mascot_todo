import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/home/get_home_data_usecase.dart';
import '../../../domain/usecases/home/complete_todo_usecase.dart';
import '../../../domain/usecases/home/create_todo_usecase.dart';
import '../../../domain/usecases/home/delete_todo_usecase.dart';
import '../../../domain/usecases/home/update_todo_usecase.dart';
import '../../../domain/usecases/mascot/gain_mascot_exp_usecase.dart';
import '../../../di/home/home_providers.dart';
import 'home_state.dart';

part 'home_viewmodel.g.dart';

/// 홈 화면 ViewModel
@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final GetHomeDataUseCase _getHomeDataUseCase;
  late final CompleteTodoUseCase _completeTodoUseCase;
  late final CreateTodoUseCase _createTodoUseCase;
  late final DeleteTodoUseCase _deleteTodoUseCase;
  late final UpdateTodoUseCase _updateTodoUseCase;
  late final GainMascotExpUseCase _gainMascotExpUseCase;

  @override
  HomeState build() {
    _getHomeDataUseCase = ref.read(getHomeDataUseCaseProvider);
    _completeTodoUseCase = ref.read(completeTodoUseCaseProvider);
    _createTodoUseCase = ref.read(createTodoUseCaseProvider);
    _deleteTodoUseCase = ref.read(deleteTodoUseCaseProvider);
    _updateTodoUseCase = ref.read(updateTodoUseCaseProvider);
    _gainMascotExpUseCase = ref.read(gainMascotExpUseCaseProvider);

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
          mascots: homeData.mascots,
          categories: homeData.categories,
          errorMessage: null,
        );
      },
    );
  }

  /// 시맨틱 카테고리명(health, work 등)을 실제 UUID로 변환
  /// 이미 로드된 state.categories를 사용하여 네트워크 요청 없이 매핑
  String? _resolveCategory(String? semanticOrUuid) {
    if (semanticOrUuid == null) return null;

    // 이미 UUID 형태이면 그대로 반환
    if (state.categories.any((c) => c.id == semanticOrUuid)) {
      return semanticOrUuid;
    }

    const semanticMapping = {
      'health': '건강 & 운동',
      'study': '학습',
      'work': '업무',
      'mindfulness': '마음챙김',
      'habit': '생활 습관',
      'hobby': '취미 & 여가',
    };

    final targetName = semanticMapping[semanticOrUuid];
    if (targetName == null) return null;

    return state.categories
        .where((c) => c.name == targetName)
        .firstOrNull
        ?.id;
  }

  /// Todo 생성
  Future<bool> createTodo({
    required String title,
    String? description,
    bool isFocus = false,
    bool isRecurring = false,
    String? categoryId,
  }) async {
    final resolvedCategoryId = _resolveCategory(categoryId);

    final result = await _createTodoUseCase(
      title: title,
      description: description,
      isFocus: isFocus,
      isRecurring: isRecurring,
      categoryId: resolvedCategoryId,
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

  /// Todo 삭제
  Future<bool> deleteTodo(String todoId) async {
    final result = await _deleteTodoUseCase(todoId);

    return result.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: failure.when(
            serverError: (msg) => msg ?? 'Todo 삭제 중 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '데이터를 삭제할 수 없습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
        return false;
      },
      (_) {
        final updatedTodos =
            state.todos.where((todo) => todo.id != todoId).toList();
        state = state.copyWith(todos: updatedTodos, errorMessage: null);
        return true;
      },
    );
  }

  /// Todo 수정
  Future<bool> updateTodo({
    required String todoId,
    required String title,
    String? description,
    bool? isFocus,
    bool? isRecurring,
    String? categoryId,
  }) async {
    final result = await _updateTodoUseCase(
      todoId: todoId,
      title: title,
      description: description,
      isFocus: isFocus,
      isRecurring: isRecurring,
      categoryId: categoryId,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: failure.when(
            serverError: (msg) => msg ?? 'Todo 수정 중 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '데이터를 수정할 수 없습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
        return false;
      },
      (updatedTodo) {
        final updatedTodos = state.todos.map((todo) {
          return todo.id == todoId ? updatedTodo : todo;
        }).toList();
        state = state.copyWith(todos: updatedTodos, errorMessage: null);
        return true;
      },
    );
  }

  /// Todo 완료 처리
  Future<void> completeTodo(String todoId) async {
    final result = await _completeTodoUseCase(todoId);

    await result.fold(
      (failure) async {
        state = state.copyWith(
          errorMessage: failure.when(
            serverError: (msg) => msg ?? 'Todo 완료 처리 중 오류가 발생했습니다',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요',
            cacheError: (msg) => msg ?? '데이터를 저장할 수 없습니다',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다',
          ),
        );
      },
      (completedTodo) async {
        // Todo 목록 업데이트
        final updatedTodos = state.todos.map((todo) {
          return todo.id == todoId ? completedTodo : todo;
        }).toList();

        state = state.copyWith(todos: updatedTodos, errorMessage: null);

        // 완료 상태이고 연결된 마스코트가 있으면 경험치 부여
        if (completedTodo.isCompleted && completedTodo.linkedMascotId != null) {
          final expResult =
              await _gainMascotExpUseCase(completedTodo.linkedMascotId!);

          expResult.fold(
            (_) {}, // 경험치 업데이트 실패는 조용히 무시 (UI 차단 불필요)
            (updatedMascot) {
              final updatedMascots = state.mascots.map((m) {
                return m.id == updatedMascot.id ? updatedMascot : m;
              }).toList();

              state = state.copyWith(
                mascots: updatedMascots,
                mainMascot: state.mainMascot?.id == updatedMascot.id
                    ? updatedMascot
                    : state.mainMascot,
              );
            },
          );

          // 완료 시 마스코트 축하 애니메이션 트리거 증가
          state = state.copyWith(
            celebrationTrigger: state.celebrationTrigger + 1,
          );
        }
      },
    );
  }
}
