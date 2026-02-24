import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/user_entity.dart';

/// 인증 Repository 인터페이스
abstract class AuthRepository {
  /// 카카오 로그인
  Future<Either<Failure, UserEntity>> signInWithKakao();

  /// 비회원 로그인
  Future<Either<Failure, UserEntity>> signInAnonymously();

  /// 로그아웃
  Future<Either<Failure, void>> signOut();

  /// 현재 로그인된 사용자 정보 가져오기
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// 인증 상태 변경 스트림
  Stream<UserEntity?> authStateChanges();
}
