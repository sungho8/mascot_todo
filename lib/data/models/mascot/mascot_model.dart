import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/mascot/mascot_entity.dart';

part 'mascot_model.freezed.dart';
part 'mascot_model.g.dart';

/// 마스코트 모델
@freezed
class MascotModel with _$MascotModel {
  const MascotModel._();

  const factory MascotModel({
    required String id,
    required String name,
    @JsonKey(name: 'image_path') required String imagePath,
    @Default(1) int level,
    @JsonKey(name: 'current_exp') @Default(0.0) double currentExp,
    @JsonKey(name: 'max_exp') @Default(100.0) double maxExp,
    @JsonKey(name: 'unlock_condition_type') required String unlockConditionType,
    @JsonKey(name: 'unlock_condition_value') required int unlockConditionValue,
    @JsonKey(name: 'unlock_description') required String unlockDescription,
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'is_unlocked') @Default(false) bool isUnlocked,
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
      unlockConditionType: unlockConditionType,
      unlockConditionValue: unlockConditionValue,
      unlockDescription: unlockDescription,
      isDefault: isDefault,
      isUnlocked: isDefault || isUnlocked, // 기본 마스코트는 항상 언락
    );
  }
}
