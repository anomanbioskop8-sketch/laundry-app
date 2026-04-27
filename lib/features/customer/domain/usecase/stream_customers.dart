import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';

class StreamCustomers {
  final CustomerRepository repository;

  StreamCustomers(this.repository);

  Stream<Either<Failure, List<CustomerEntity>>> call() {
    return repository.streamCustomers();
  }
}
