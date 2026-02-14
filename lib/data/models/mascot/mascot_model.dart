import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/mascot/mascot_entity.dart';

part 'mascot_model.freezed.dart';
part 'mascot_model.g.dart';

/// 마스코트 모델
@freezed
abstract class MascotModel with _$MascotModel {
  const MascotModel._();

  const factory MascotModel({
    required String id,
    required String name,
    required String imagePath,
    required int level,
    required double currentExp,
    required double maxExp,
    required bool isLocked,
    String? unlockCondition,
  }) = _MascotModel;

  factory MascotModel.fromJson(Map<String, dynamic> json) =>
      _$MascotModelFromJson(json);

  /// Model -> Entity 변환
  MascotEntity toEntity() {
    return MascotEntity(
      id: id,
      name: name,
      imagePath: imagePath,
      level: level,
      currentExp: currentExp,
      maxExp: maxExp,
      isLocked: isLocked,
      unlockCondition: unlockCondition,
    );
  }
}
