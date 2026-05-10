import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/error/mappers/failure_mapper.dart';

extension AppExceptionX on AppException {
  Failure get toFailure {
    return FailureMapper.mapExceptionToFailure(this);
  }
}
