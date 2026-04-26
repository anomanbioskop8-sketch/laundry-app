enum ExceptionType {
  server,
  permission,
  notFound,
  network,
  timeout,
  unknown,
  unauthorized,
}

abstract class AppException implements Exception {
  final String message;
  final ExceptionType type;
  final String? code;

  const AppException(this.message, {required this.type, this.code});

  @override
  String toString() =>
      'AppException(type: $type, message: $message, code: $code)';
}

class ServerException extends AppException {
  const ServerException(super.message, {super.code})
    : super(type: ExceptionType.server);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message)
    : super(type: ExceptionType.unauthorized);
}

class PermissionException extends AppException {
  const PermissionException(super.message)
    : super(type: ExceptionType.permission);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message) : super(type: ExceptionType.notFound);
}

class NetworkException extends AppException {
  const NetworkException(super.message) : super(type: ExceptionType.network);
}

class TimeoutException extends AppException {
  const TimeoutException(super.message) : super(type: ExceptionType.timeout);
}

class UnknownException extends AppException {
  const UnknownException(super.message) : super(type: ExceptionType.unknown);
}
