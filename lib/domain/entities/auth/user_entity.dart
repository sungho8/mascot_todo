import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// 사용자 Entity
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    String? kakaoId,
    String? nickname,
    String? profileImageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserEntity;
}
