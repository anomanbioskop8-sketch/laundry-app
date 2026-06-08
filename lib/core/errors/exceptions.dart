// =============================================================================
// File        : exceptions.dart
// Path        : lib/core/error/exceptions.dart
// Layer       : Core (Error Handling)
// -----------------------------------------------------------------------------

/// =========================
/// EXCEPTION TYPE
/// =========================
enum ExceptionType {
  unauthorized,
  permission,
  notFound,
  validation, // 🔥 baru
  conflict, // 🔥 baru
  network,
  timeout,
  server,
  unknown,
}

/// =========================
/// BASE EXCEPTION
/// =========================
abstract class AppException implements Exception {
  final String message;
  final ExceptionType type;
  final String? code;

  const AppException(this.message, {required this.type, this.code});

  @override
  String toString() {
    return 'AppException(type: $type, message: $message, code: $code)';
  }
}

/// =========================
/// SPECIFIC EXCEPTIONS
/// =========================

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message, {super.code})
    : super(type: ExceptionType.unauthorized);
}

class PermissionException extends AppException {
  const PermissionException(super.message, {super.code})
    : super(type: ExceptionType.permission);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message, {super.code})
    : super(type: ExceptionType.notFound);
}

/// 🔥 VALIDATION (FORM / INPUT ERROR)
class ValidationException extends AppException {
  const ValidationException(super.message, {super.code})
    : super(type: ExceptionType.validation);
}

/// 🔥 CONFLICT (DATA DUPLICATE / STATE CONFLICT)
class ConflictException extends AppException {
  const ConflictException(super.message, {super.code})
    : super(type: ExceptionType.conflict);
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.code})
    : super(type: ExceptionType.network);
}

class TimeoutException extends AppException {
  const TimeoutException(super.message, {super.code})
    : super(type: ExceptionType.timeout);
}

class ServerException extends AppException {
  const ServerException(super.message, {super.code})
    : super(type: ExceptionType.server);
}

class UnknownException extends AppException {
  const UnknownException(super.message, {super.code})
    : super(type: ExceptionType.unknown);
}
