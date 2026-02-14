import 'package:dio/dio.dart';
import 'app_exception.dart';

/// Maps DioException to AppException
class ExceptionMapper {
  ExceptionMapper._();

  static AppException fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: '네트워크 연결이 불안정합니다. 다시 시도해주세요.',
          code: 'TIMEOUT',
          details: exception,
        );

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        final data = exception.response?.data;

        if (statusCode == 401 || statusCode == 403) {
          return AuthException(
            message: data?['message'] ?? '인증에 실패했습니다.',
            code: statusCode.toString(),
            details: exception,
          );
        }

        if (statusCode != null && statusCode >= 500) {
          return ServerException(
            message: data?['message'] ?? '서버 오류가 발생했습니다.',
            code: statusCode.toString(),
            details: exception,
          );
        }

        if (statusCode != null && statusCode >= 400) {
          return ValidationException(
            message: data?['message'] ?? '요청이 올바르지 않습니다.',
            code: statusCode.toString(),
            details: exception,
          );
        }

        return ServerException(
          message: '알 수 없는 오류가 발생했습니다.',
          code: statusCode?.toString(),
          details: exception,
        );

      case DioExceptionType.cancel:
        return NetworkException(
          message: '요청이 취소되었습니다.',
          code: 'CANCELLED',
          details: exception,
        );

      case DioExceptionType.connectionError:
        return NetworkException(
          message: '네트워크에 연결할 수 없습니다. 인터넷 연결을 확인해주세요.',
          code: 'CONNECTION_ERROR',
          details: exception,
        );

      case DioExceptionType.badCertificate:
        return NetworkException(
          message: '보안 인증서 오류가 발생했습니다.',
          code: 'BAD_CERTIFICATE',
          details: exception,
        );

      case DioExceptionType.unknown:
        return UnknownException(
          message: exception.message ?? '알 수 없는 오류가 발생했습니다.',
          code: 'UNKNOWN',
          details: exception,
        );
    }
  }

  static AppException fromException(Exception exception) {
    if (exception is DioException) {
      return fromDioException(exception);
    }

    if (exception is AppException) {
      return exception;
    }

    return UnknownException(
      message: exception.toString(),
      code: 'UNKNOWN',
      details: exception,
    );
  }
}
