abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

/// 🔥 General
class ServerException extends AppException {
  const ServerException(super.message);
}

/// 🔥 Specific
class PermissionException extends AppException {
  const PermissionException(super.message);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message);
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class TimeoutException extends AppException {
  const TimeoutException(super.message);
}

class UnknownException extends AppException {
  const UnknownException(super.message);
}
