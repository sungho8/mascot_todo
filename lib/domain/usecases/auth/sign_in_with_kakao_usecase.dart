import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/user_entity.dart';
import '../../repositories/auth/auth_repository.dart';

/// 카카오 로그인 UseCase
class SignInWithKakaoUseCase {
  final AuthRepository _repository;

  SignInWithKakaoUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, UserEntity>> call() {
    return _repository.signInWithKakao();
  }
}
