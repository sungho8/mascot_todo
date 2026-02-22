import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/mascot/mascot_entity.dart';
import '../../repositories/mascot/mascot_repository.dart';

/// Todo 완료 시 연결된 마스코트에 경험치를 부여하는 UseCase
class GainMascotExpUseCase {
  final MascotRepository _mascotRepository;

  /// Todo 1개 완료당 획득 경험치
  static const double expPerTodo = 10.0;

  GainMascotExpUseCase(this._mascotRepository);

  Future<Either<Failure, MascotEntity>> call(String userMascotId) =>
      _mascotRepository.addExp(userMascotId, expPerTodo);
}
