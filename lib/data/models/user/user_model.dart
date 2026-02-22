import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// 사용자 모델
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String name,
    String? profileImagePath,
    required int level,
    required double currentExp,
    required double maxExp,
    required int totalCompleted,
    required int currentStreak,
    @Default(0) int earlyBirdCount,
    @Default(0) int dailyMaxCompleted,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Model -> Entity 변환
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      profileImagePath: profileImagePath,
      level: level,
      currentExp: currentExp,
      maxExp: maxExp,
      totalCompleted: totalCompleted,
      currentStreak: currentStreak,
      earlyBirdCount: earlyBirdCount,
      dailyMaxCompleted: dailyMaxCompleted,
    );
  }
}
