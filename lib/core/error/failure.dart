import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// 애플리케이션 에러 표현
@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError({String? message}) = ServerFailure;
  const factory Failure.networkError({String? message}) = NetworkFailure;
  const factory Failure.cacheError({String? message}) = CacheFailure;
  const factory Failure.unknownError({String? message}) = UnknownFailure;
}
