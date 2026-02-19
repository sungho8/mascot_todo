import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/data_sources/remote/auth/auth_remote_data_source.dart';
import '../../data/repositories_impl/auth/auth_repository_impl.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/usecases/auth/get_current_user_usecase.dart';
import '../../domain/usecases/auth/sign_in_with_kakao_usecase.dart';
import '../../domain/usecases/auth/sign_out_usecase.dart';

part 'auth_providers.g.dart';

/// Auth Remote DataSource Provider
@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSourceImpl();
}

/// Auth Repository Provider
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
  );
}

/// Sign In With Kakao UseCase Provider
@riverpod
SignInWithKakaoUseCase signInWithKakaoUseCase(
  SignInWithKakaoUseCaseRef ref,
) {
  return SignInWithKakaoUseCase(
    repository: ref.watch(authRepositoryProvider),
  );
}

/// Sign Out UseCase Provider
@riverpod
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) {
  return SignOutUseCase(
    repository: ref.watch(authRepositoryProvider),
  );
}

/// Get Current User UseCase Provider
@riverpod
GetCurrentUserUseCase getCurrentUserUseCase(GetCurrentUserUseCaseRef ref) {
  return GetCurrentUserUseCase(
    repository: ref.watch(authRepositoryProvider),
  );
}
