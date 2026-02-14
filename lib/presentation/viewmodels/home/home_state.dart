import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/todo/todo_entity.dart';
import '../../../domain/entities/mascot/mascot_entity.dart';
import '../../../domain/entities/user/user_entity.dart';

part 'home_state.freezed.dart';

/// 홈 화면 상태
@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    UserEntity? user,
    @Default([]) List<TodoEntity> todos,
    TodoEntity? focusTodo,
    MascotEntity? mainMascot,
    String? errorMessage,
  }) = _HomeState;
}

/// 홈 화면 상태 enum
enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}
