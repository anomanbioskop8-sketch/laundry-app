import 'package:app_laundry/core/error/failure.dart';

import '../exceptions.dart';

class FailureMapper {
  static Failure mapExceptionToFailure(AppException e) {
    switch (e.type) {
      case ExceptionType.server:
        return ServerFailure(e.message);

      case ExceptionType.network:
        return NetworkFailure(e.message);

      case ExceptionType.permission:
        return PermissionFailure(e.message);

      case ExceptionType.notFound:
        return NotFoundFailure(e.message);

      case ExceptionType.unauthorized:
        return UnauthorizedFailure(e.message);

      case ExceptionType.timeout:
        return TimeoutFailure(e.message);

      default:
        return UnknownFailure(e.message);
    }
  }
}
