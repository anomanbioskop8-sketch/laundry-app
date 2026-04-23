import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/usecase/base_usecase.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customers/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';

class UpdateCustomerUseCase implements UseCase<void, UpdateCustomerParams> {
  final CustomerRepository repository;

  UpdateCustomerUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateCustomerParams params) {
    return repository.update(params.customer);
  }
}
