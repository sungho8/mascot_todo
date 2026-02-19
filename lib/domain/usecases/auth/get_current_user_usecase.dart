import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

/// 현재 사용자 조회 UseCase
class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, UserEntity?>> call() {
    return _repository.getCurrentUser();
  }
}
