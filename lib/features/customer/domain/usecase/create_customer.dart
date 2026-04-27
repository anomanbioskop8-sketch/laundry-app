import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:uuid/uuid.dart';

class CreateCustomer {
  final CustomerRepository repository;

  CreateCustomer(this.repository);

  Future<Either<Failure, void>> call(CreateCustomerParams params) {
    final id = const Uuid().v4();
    final customer = CustomerEntity(
      id: id,
      name: params.name,
      phone: params.phone,
    );
    return repository.createCustomer(customer);
  }
}
