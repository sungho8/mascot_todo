import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../repositories/auth/auth_repository.dart';

/// 로그아웃 UseCase
class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, void>> call() {
    return _repository.signOut();
  }
}
