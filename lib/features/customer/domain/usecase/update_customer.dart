import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';

class UpdateCustomer {
  final CustomerRepository repository;

  UpdateCustomer(this.repository);

  Future<Either<Failure, void>> call(UpdateCustomerParams params) {
    final customer = CustomerEntity(
      id: params.id,
      name: params.name,
      phone: params.phone,
    );
    return repository.updateCustomer(customer);
  }
}
