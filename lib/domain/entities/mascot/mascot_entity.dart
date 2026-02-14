import 'package:freezed_annotation/freezed_annotation.dart';

part 'mascot_entity.freezed.dart';

/// 마스코트 엔티티
@freezed
abstract class MascotEntity with _$MascotEntity {
  const factory MascotEntity({
    required String id,
    required String name,
    required String imagePath,
    required int level,
    required double currentExp,
    required double maxExp,
    required bool isLocked,
    String? unlockCondition,
  }) = _MascotEntity;
}
