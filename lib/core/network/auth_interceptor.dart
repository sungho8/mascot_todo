import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';

/// AuthInterceptor provider
final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  return AuthInterceptor(
    storage: const FlutterSecureStorage(),
  );
});

/// Interceptor for injecting authentication tokens
/// CLAUDE.md: AuthInterceptor는 토큰 주입만 담당 (Infrastructure)
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  AuthInterceptor({
    required this.storage,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get access token from secure storage
    final accessToken = await storage.read(key: AppConstants.accessTokenKey);

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }
}
