import 'package:app_laundry/core/error/failure.dart';

import '../exceptions.dart';

class FailureMapper {
  static Failure map(AppException e) {
    if (e is PermissionException) {
      return PermissionFailure(e.message);
    }
    if (e is NotFoundException) {
      return NotFoundFailure(e.message);
    }
    if (e is NetworkException) {
      return NetworkFailure(e.message);
    }
    if (e is TimeoutException) {
      return TimeoutFailure(e.message);
    }
    if (e is ServerException) {
      return ServerFailure(e.message);
    }
    return UnknownFailure(e.message);
  }
}
