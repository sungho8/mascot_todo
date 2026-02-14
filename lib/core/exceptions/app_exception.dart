/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException({
    required this.message,
    this.code,
    this.details,
  });

  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Server error exceptions
class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Authentication exceptions
class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Validation exceptions
class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Cache exceptions
class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Unknown exceptions
class UnknownException extends AppException {
  const UnknownException({
    required super.message,
    super.code,
    super.details,
  });
}
