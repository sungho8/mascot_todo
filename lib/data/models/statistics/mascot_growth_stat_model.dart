import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/statistics/mascot_growth_stat_entity.dart';

part 'mascot_growth_stat_model.freezed.dart';
part 'mascot_growth_stat_model.g.dart';

@freezed
abstract class MascotGrowthStatModel with _$MascotGrowthStatModel {
  const factory MascotGrowthStatModel({
    @JsonKey(name: 'mascot_id') required String mascotId,
    @JsonKey(name: 'mascot_name') required String mascotName,
    @JsonKey(name: 'current_level') required int currentLevel,
    @JsonKey(name: 'current_exp') required double currentExp,
    @JsonKey(name: 'max_exp') required int maxExp,
    @JsonKey(name: 'linked_todo_count') required int linkedTodoCount,
    @JsonKey(name: 'is_unlocked') required bool isUnlocked,
  }) = _MascotGrowthStatModel;

  factory MascotGrowthStatModel.fromJson(Map<String, dynamic> json) =>
      _$MascotGrowthStatModelFromJson(json);
}

extension MascotGrowthStatModelX on MascotGrowthStatModel {
  MascotGrowthStatEntity toEntity() {
    return MascotGrowthStatEntity(
      mascotId: mascotId,
      mascotName: mascotName,
      currentLevel: currentLevel,
      currentExp: currentExp,
      maxExp: maxExp,
      linkedTodoCount: linkedTodoCount,
      isUnlocked: isUnlocked,
    );
  }
}
