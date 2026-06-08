import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/errors/mappers/failure_mapper.dart';

extension AppExceptionX on AppException {
  Failure get toFailure {
    return FailureMapper.mapExceptionToFailure(this);
  }
}
