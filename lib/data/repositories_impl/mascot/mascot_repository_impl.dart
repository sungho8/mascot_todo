import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/mascot/mascot_entity.dart';
import '../../../domain/repositories/mascot/mascot_repository.dart';
import '../../data_sources/local/mascot/mascot_local_data_source.dart';

/// Mascot Repository 구현체
class MascotRepositoryImpl implements MascotRepository {
  final MascotLocalDataSource _localDataSource;

  MascotRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<MascotEntity>>> getMascots() async {
    try {
      final models = await _localDataSource.getMascots();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
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
      final model = await _localDataSource.getMostUsedMascot();
      return Right(model?.toEntity());
    } catch (e) {
      return Left(Failure.unknownError(message: e.toString()));
    }
  }
}
