import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/user/user_entity.dart';
import '../../../domain/repositories/user/user_repository.dart';
import '../../data_sources/local/user/user_local_data_source.dart';

/// User Repository 구현체
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _localDataSource;

  UserRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final model = await _localDataSource.getCurrentUser();
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
