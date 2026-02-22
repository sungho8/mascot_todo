import 'package:freezed_annotation/freezed_annotation.dart';

part 'mascot_growth_stat_entity.freezed.dart';

@freezed
abstract class MascotGrowthStatEntity with _$MascotGrowthStatEntity {
  const factory MascotGrowthStatEntity({
    required String mascotId,
    required String mascotName,
    required int currentLevel,
    required double currentExp,
    required int maxExp,
    required int linkedTodoCount,
    required bool isUnlocked,
  }) = _MascotGrowthStatEntity;
}
