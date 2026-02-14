import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/user/user_entity.dart';

/// User Repository 인터페이스
abstract class UserRepository {
  /// 현재 사용자 정보 조회
  Future<Either<Failure, UserEntity>> getCurrentUser();
}
