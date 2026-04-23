import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/usecase/base_usecase.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customers/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';

class CreateCustomerUseCase implements UseCase<void, CreateCustomerParams> {
  final CustomerRepository repository;

  CreateCustomerUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateCustomerParams params) {
    return repository.create(params.customer);
  }
}
