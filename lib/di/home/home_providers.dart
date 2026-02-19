import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/data_sources/local/mascot/mascot_local_data_source.dart';
import '../../data/data_sources/remote/category/category_remote_data_source.dart';
import '../../data/data_sources/remote/todo/todo_remote_data_source.dart';
import '../../data/data_sources/remote/user/user_remote_data_source.dart';
import '../../data/repositories_impl/todo/todo_repository_impl.dart';
import '../../data/repositories_impl/mascot/mascot_repository_impl.dart';
import '../../data/repositories_impl/category/category_repository_impl.dart';
import '../../data/repositories_impl/user/user_repository_impl.dart';
import '../../domain/repositories/todo/todo_repository.dart';
import '../../domain/repositories/mascot/mascot_repository.dart';
import '../../domain/repositories/category/category_repository.dart';
import '../../domain/repositories/user/user_repository.dart';
import '../../domain/usecases/home/get_home_data_usecase.dart';
import '../../domain/usecases/home/complete_todo_usecase.dart';
import '../../domain/usecases/home/create_todo_usecase.dart';

part 'home_providers.g.dart';

/// DataSource Providers

@riverpod
TodoRemoteDataSource todoRemoteDataSource(Ref ref) {
  return TodoRemoteDataSourceImpl();
}

@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  return UserRemoteDataSourceImpl();
}

@riverpod
MascotLocalDataSource mascotLocalDataSource(Ref ref) {
  return MascotLocalDataSource();
}

@riverpod
CategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  return CategoryRemoteDataSourceImpl();
}

/// Repository Providers

@riverpod
TodoRepository todoRepository(Ref ref) {
  final dataSource = ref.watch(todoRemoteDataSourceProvider);
  return TodoRepositoryImpl(dataSource);
}

@riverpod
MascotRepository mascotRepository(Ref ref) {
  final dataSource = ref.watch(mascotLocalDataSourceProvider);
  return MascotRepositoryImpl(dataSource);
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final dataSource = ref.watch(categoryRemoteDataSourceProvider);
  return CategoryRepositoryImpl(dataSource);
}

@riverpod
UserRepository userRepository(Ref ref) {
  final dataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(dataSource);
}

/// UseCase Providers

@riverpod
GetHomeDataUseCase getHomeDataUseCase(Ref ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  final mascotRepository = ref.watch(mascotRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return GetHomeDataUseCase(
    todoRepository,
    mascotRepository,
    userRepository,
    categoryRepository,
  );
}

@riverpod
CompleteTodoUseCase completeTodoUseCase(Ref ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  return CompleteTodoUseCase(todoRepository);
}

@riverpod
CreateTodoUseCase createTodoUseCase(Ref ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  return CreateTodoUseCase(todoRepository);
}
