// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/auth/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// 사용자 Model
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    @JsonKey(name: 'kakao_id') String? kakaoId,
    String? nickname,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Model -> Entity 변환
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      kakaoId: kakaoId,
      nickname: nickname,
      profileImageUrl: profileImageUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Entity -> Model 변환
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      kakaoId: entity.kakaoId,
      nickname: entity.nickname,
      profileImageUrl: entity.profileImageUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
