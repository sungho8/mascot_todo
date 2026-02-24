import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

/// 비회원 로그인 UseCase
class SignInAnonymouslyUseCase {
  final AuthRepository _repository;

  SignInAnonymouslyUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<Either<Failure, UserEntity>> call() {
    return _repository.signInAnonymously();
  }
}
