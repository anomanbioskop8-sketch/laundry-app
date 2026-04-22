import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<CustomerEntity>>> getAll();
  Stream<List<CustomerEntity>> streamByCompany(String companyId);

  Future<Either<Failure, void>> create(CustomerEntity customer);
  Future<Either<Failure, void>> update(CustomerEntity customer);
  Future<Either<Failure, void>> delete(String id);
}
