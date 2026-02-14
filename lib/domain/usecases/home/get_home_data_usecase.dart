import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/todo/todo_entity.dart';
import '../../entities/mascot/mascot_entity.dart';
import '../../entities/user/user_entity.dart';
import '../../repositories/todo/todo_repository.dart';
import '../../repositories/mascot/mascot_repository.dart';
import '../../repositories/user/user_repository.dart';

/// 홈 화면 데이터 조회 결과
class HomeData {
  final UserEntity user;
  final List<TodoEntity> todos;
  final TodoEntity? focusTodo;
  final MascotEntity? mainMascot;

  HomeData({
    required this.user,
    required this.todos,
    this.focusTodo,
    this.mainMascot,
  });
}

/// 홈 화면 데이터 조회 UseCase
class GetHomeDataUseCase {
  final TodoRepository _todoRepository;
  final MascotRepository _mascotRepository;
  final UserRepository _userRepository;

  GetHomeDataUseCase(
    this._todoRepository,
    this._mascotRepository,
    this._userRepository,
  );

  Future<Either<Failure, HomeData>> call() async {
    try {
      // 병렬로 데이터 조회
      final results = await Future.wait([
        _userRepository.getCurrentUser().then((result) => result.fold(
              (failure) => throw failure,
              (user) => user,
            )),
        _todoRepository.getTodos().then((result) => result.fold(
              (failure) => throw failure,
              (todos) => todos,
            )),
        _todoRepository.getFocusTodo().then((result) => result.fold(
              (failure) => throw failure,
              (focusTodo) => focusTodo,
            )),
        _mascotRepository.getMostUsedMascot().then((result) => result.fold(
              (failure) => throw failure,
              (mascot) => mascot,
            )),
      ]);

      final homeData = HomeData(
        user: results[0] as UserEntity,
        todos: results[1] as List<TodoEntity>,
        focusTodo: results[2] as TodoEntity?,
        mainMascot: results[3] as MascotEntity?,
      );

      return Right(homeData);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
