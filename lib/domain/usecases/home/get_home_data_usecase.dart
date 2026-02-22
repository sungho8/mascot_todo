import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/category/category_entity.dart';
import '../../entities/todo/todo_entity.dart';
import '../../entities/mascot/mascot_entity.dart';
import '../../entities/user/user_entity.dart';
import '../../repositories/category/category_repository.dart';
import '../../repositories/todo/todo_repository.dart';
import '../../repositories/mascot/mascot_repository.dart';
import '../../repositories/user/user_repository.dart';

/// 홈 화면 데이터 조회 결과
class HomeData {
  final UserEntity user;
  final List<TodoEntity> todos;
  final TodoEntity? focusTodo;
  final MascotEntity? mainMascot;
  final List<MascotEntity> mascots;
  final List<CategoryEntity> categories;

  HomeData({
    required this.user,
    required this.todos,
    this.focusTodo,
    this.mainMascot,
    required this.mascots,
    required this.categories,
  });
}

/// 홈 화면 데이터 조회 UseCase
class GetHomeDataUseCase {
  final TodoRepository _todoRepository;
  final MascotRepository _mascotRepository;
  final UserRepository _userRepository;
  final CategoryRepository _categoryRepository;

  GetHomeDataUseCase(
    this._todoRepository,
    this._mascotRepository,
    this._userRepository,
    this._categoryRepository,
  );

  Future<Either<Failure, HomeData>> call() async {
    try {
      // 병렬로 데이터 조회
      final results = await Future.wait([
        _userRepository.getCurrentUser().then(
          (result) => result.fold((failure) => throw failure, (user) => user),
        ),
        _todoRepository.getTodos().then(
          (result) => result.fold((failure) => throw failure, (todos) => todos),
        ),
        _todoRepository.getFocusTodo().then(
          (result) =>
              result.fold((failure) => throw failure, (focusTodo) => focusTodo),
        ),
        _mascotRepository.getMostUsedMascot().then(
          (result) =>
              result.fold((failure) => throw failure, (mascot) => mascot),
        ),
        _mascotRepository.getMascots().then(
          (result) =>
              result.fold((failure) => throw failure, (mascots) => mascots),
        ),
        _categoryRepository.getCategories().then(
          (result) => result.fold(
            (failure) => throw failure,
            (categories) => categories,
          ),
        ),
      ]);

      final homeData = HomeData(
        user: results[0] as UserEntity,
        todos: results[1] as List<TodoEntity>,
        focusTodo: results[2] as TodoEntity?,
        mainMascot: results[3] as MascotEntity?,
        mascots: results[4] as List<MascotEntity>,
        categories: results[5] as List<CategoryEntity>,
      );

      return Right(homeData);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
