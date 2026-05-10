// core/error/extensions/unauthorized_exception_ext.dart

import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';

extension UnauthorizedExceptionX on UnauthorizedException {
  UnauthorizedFailure get failure {
    return UnauthorizedFailure(message);
  }
}
