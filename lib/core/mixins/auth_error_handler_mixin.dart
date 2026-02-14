import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../exceptions/app_exception.dart';
import '../utils/logger.dart';

/// Mixin for handling authentication errors (401/403)
/// CLAUDE.md: AuthErrorHandlerMixin은 401/403 처리 (Presentation)
///   - 401: 자동 토큰 갱신 → 재시도
///   - 403: 토큰 삭제 → 로그아웃
mixin AuthErrorHandlerMixin {
  /// Handle authentication error
  /// Returns true if error was handled (should retry), false otherwise
  Future<bool> handleAuthError(
    Ref ref,
    AppException exception,
  ) async {
    if (exception is! AuthException) {
      return false;
    }

    final statusCode = exception.code;

    // 401: Unauthorized - Try to refresh token
    if (statusCode == '401') {
      logger.w('401 Unauthorized - Attempting token refresh');

      // TODO: Implement token refresh logic
      // final refreshed = await ref.read(authRepositoryProvider).refreshToken();
      // if (refreshed) {
      //   logger.i('Token refreshed successfully');
      //   return true; // Indicate retry
      // }

      logger.e('Token refresh failed - Logging out');
      await _logout(ref);
      return false;
    }

    // 403: Forbidden - Clear tokens and logout
    if (statusCode == '403') {
      logger.w('403 Forbidden - Logging out');
      await _logout(ref);
      return false;
    }

    return false;
  }

  /// Logout user and clear tokens
  Future<void> _logout(Ref ref) async {
    // TODO: Implement logout logic
    // await ref.read(authRepositoryProvider).logout();
    // Navigate to login screen
    logger.i('User logged out');
  }
}
