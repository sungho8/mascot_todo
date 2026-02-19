import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/auth/user_entity.dart';

part 'auth_state.freezed.dart';

/// 인증 상태 Enum
enum AuthStatus {
  idle,
  loading,
  authenticated,
  unauthenticated,
  error,
}

/// 인증 State
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.idle) AuthStatus status,
    UserEntity? user,
    String? errorMessage,
  }) = _AuthState;
}
