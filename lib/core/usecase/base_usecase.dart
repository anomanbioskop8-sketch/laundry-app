import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';

abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}

class NoParams {}
