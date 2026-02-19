import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../data_sources/remote/auth/auth_remote_data_source.dart';

/// 인증 Repository 구현체
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final Logger _logger = Logger();

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> signInWithKakao() async {
    try {
      final userModel = await _remoteDataSource.signInWithKakao();
      return Right(userModel.toEntity());
    } catch (e, stackTrace) {
      _logger.e('카카오 로그인 실패', error: e, stackTrace: stackTrace);
      return const Left(
        Failure.serverError(message: '카카오 로그인에 실패했습니다.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _remoteDataSource.signOut();
      return const Right(null);
    } catch (e, stackTrace) {
      _logger.e('로그아웃 실패', error: e, stackTrace: stackTrace);
      return const Left(
        Failure.serverError(message: '로그아웃에 실패했습니다.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final userModel = await _remoteDataSource.getCurrentUser();
      return Right(userModel?.toEntity());
    } catch (e, stackTrace) {
      _logger.e('현재 사용자 조회 실패', error: e, stackTrace: stackTrace);
      return const Left(
        Failure.serverError(message: '사용자 정보를 불러오는데 실패했습니다.'),
      );
    }
  }

  @override
  Stream<UserEntity?> authStateChanges() {
    return _remoteDataSource.authStateChanges().map(
          (userModel) => userModel?.toEntity(),
        );
  }
}
