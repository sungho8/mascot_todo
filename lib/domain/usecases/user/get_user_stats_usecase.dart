import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/user/user_entity.dart';
import '../../repositories/user/user_repository.dart';

/// 사용자 통계 데이터 조회 UseCase
/// Settings 페이지 최적화를 위해 UserEntity만 반환
class GetUserStatsUseCase {
  final UserRepository _userRepository;

  GetUserStatsUseCase(this._userRepository);

  Future<Either<Failure, UserEntity>> call() async {
    return await _userRepository.getCurrentUser();
  }
}
