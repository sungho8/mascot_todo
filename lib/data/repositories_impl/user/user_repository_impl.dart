import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/user/user_entity.dart';
import '../../../domain/repositories/user/user_repository.dart';
import '../../data_sources/remote/user/user_remote_data_source.dart';

/// User Repository 구현체
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final model = await _remoteDataSource.getCurrentUser();
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.serverError(message: e.toString()));
    }
  }
}
