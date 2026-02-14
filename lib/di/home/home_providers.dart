import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/data_sources/local/todo/todo_local_data_source.dart';
import '../../data/data_sources/local/mascot/mascot_local_data_source.dart';
import '../../data/data_sources/local/category/category_local_data_source.dart';
import '../../data/data_sources/local/user/user_local_data_source.dart';
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

part 'home_providers.g.dart';

/// DataSource Providers

@riverpod
TodoLocalDataSource todoLocalDataSource(Ref ref) {
  return TodoLocalDataSource();
}

@riverpod
MascotLocalDataSource mascotLocalDataSource(Ref ref) {
  return MascotLocalDataSource();
}

@riverpod
CategoryLocalDataSource categoryLocalDataSource(Ref ref) {
  return CategoryLocalDataSource();
}

@riverpod
UserLocalDataSource userLocalDataSource(Ref ref) {
  return UserLocalDataSource();
}

/// Repository Providers

@riverpod
TodoRepository todoRepository(Ref ref) {
  final dataSource = ref.watch(todoLocalDataSourceProvider);
  return TodoRepositoryImpl(dataSource);
}

@riverpod
MascotRepository mascotRepository(Ref ref) {
  final dataSource = ref.watch(mascotLocalDataSourceProvider);
  return MascotRepositoryImpl(dataSource);
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final dataSource = ref.watch(categoryLocalDataSourceProvider);
  return CategoryRepositoryImpl(dataSource);
}

@riverpod
UserRepository userRepository(Ref ref) {
  final dataSource = ref.watch(userLocalDataSourceProvider);
  return UserRepositoryImpl(dataSource);
}

/// UseCase Providers

@riverpod
GetHomeDataUseCase getHomeDataUseCase(Ref ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  final mascotRepository = ref.watch(mascotRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return GetHomeDataUseCase(todoRepository, mascotRepository, userRepository);
}

@riverpod
CompleteTodoUseCase completeTodoUseCase(Ref ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  return CompleteTodoUseCase(todoRepository);
}
