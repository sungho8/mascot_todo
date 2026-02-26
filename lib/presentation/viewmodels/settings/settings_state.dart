import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user/user_entity.dart';

part 'settings_state.freezed.dart';

/// 설정 화면 상태
@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(SettingsStatus.initial) SettingsStatus status,
    UserEntity? user,
    String? errorMessage,
  }) = _SettingsState;
}

/// 설정 화면 상태 enum
enum SettingsStatus {
  initial,
  loading,
  loaded,
  error,
  logoutSuccess,
}
