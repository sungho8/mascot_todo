import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// 사용자 엔티티
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
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
  }) = _UserEntity;
}
