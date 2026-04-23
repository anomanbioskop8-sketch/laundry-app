import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';

class StreamCustomersUseCase {
  final CustomerRepository repository;

  StreamCustomersUseCase(this.repository);

  Stream<List<CustomerEntity>> call(StreamCustomerParams params) {
    return repository.streamByCompany(params.companyId);
  }
}
