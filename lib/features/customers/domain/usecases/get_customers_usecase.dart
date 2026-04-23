import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/usecase/base_usecase.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/repositories/customer_repository.dart';

class GetCustomersUseCase implements UseCase<List<CustomerEntity>, NoParams> {
  final CustomerRepository repository;

  GetCustomersUseCase(this.repository);

  @override
  Future<Either<Failure, List<CustomerEntity>>> call(NoParams params) {
    return repository.getAll();
  }
}
