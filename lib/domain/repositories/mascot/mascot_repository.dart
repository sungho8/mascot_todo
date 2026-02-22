import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../entities/mascot/mascot_entity.dart';

/// Mascot Repository 인터페이스
abstract class MascotRepository {
  /// 전체 마스코트 목록 조회
  Future<Either<Failure, List<MascotEntity>>> getMascots();

  /// 특정 마스코트 조회
  Future<Either<Failure, MascotEntity>> getMascotById(String mascotId);

  /// 가장 많이 사용된 마스코트 조회
  Future<Either<Failure, MascotEntity?>> getMostUsedMascot();

  /// 마스코트 경험치 추가 및 레벨업 처리
  /// [userMascotId] user_mascots.id (todos.linked_mascot_id 참조값)
  Future<Either<Failure, MascotEntity>> addExp(
    String userMascotId,
    double expGain,
  );
}
