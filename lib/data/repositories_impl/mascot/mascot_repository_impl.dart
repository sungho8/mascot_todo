import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/mascot/mascot_entity.dart';
import '../../../domain/repositories/mascot/mascot_repository.dart';
import '../../data_sources/local/mascot/mascot_local_data_source.dart';
import '../../data_sources/remote/mascot/mascot_remote_data_source.dart';

/// Mascot Repository 구현체
class MascotRepositoryImpl implements MascotRepository {
  final MascotLocalDataSource _localDataSource;
  final MascotRemoteDataSource _remoteDataSource;

  MascotRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, List<MascotEntity>>> getMascots() async {
    try {
      // 1. Remote (Supabase)에서 마스터 데이터 조회 시도
      final remoteModels = await _remoteDataSource.getMascots();
      final entities = remoteModels.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      // 2. 실패 시 Local (Dummy) 데이터로 Fallback
      try {
        final localModels = await _localDataSource.getMascots();
        final entities = localModels.map((model) => model.toEntity()).toList();
        return Right(entities);
      } catch (localError) {
        return Left(Failure.unknownError(message: localError.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MascotEntity>> getMascotById(String mascotId) async {
    try {
      final model = await _localDataSource.getMascotById(mascotId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MascotEntity?>> getMostUsedMascot() async {
    try {
      // Remote: user_mascots에서 메인 마스코트 조회 (is_main=true 또는 첫 번째)
      // remote가 null을 정상 반환하면 로컬 더미로 빠지지 않고 null 반환
      final model = await _remoteDataSource.getMostUsedMascot();
      return Right(model?.toEntity());
    } catch (e) {
      // 네트워크 오류 등 예외 시에만 로컬 fallback
      try {
        final localModel = await _localDataSource.getMostUsedMascot();
        return Right(localModel?.toEntity());
      } catch (localError) {
        return Left(Failure.unknownError(message: localError.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MascotEntity>> addExp(
    String userMascotId,
    double expGain,
  ) async {
    try {
      final model = await _remoteDataSource.addExp(userMascotId, expGain);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
