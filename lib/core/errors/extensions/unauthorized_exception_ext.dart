// core/error/extensions/unauthorized_exception_ext.dart

import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/failure.dart';

extension UnauthorizedExceptionX on UnauthorizedException {
  UnauthorizedFailure get failure {
    return UnauthorizedFailure(message);
  }
}
