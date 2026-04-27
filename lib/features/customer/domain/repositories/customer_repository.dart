import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

abstract class CustomerRepository {
  /// =========================
  /// CREATE
  /// =========================
  Future<Either<Failure, void>> createCustomer(CustomerEntity customer);

  /// =========================
  /// GET SINGLE
  /// =========================
  Future<Either<Failure, CustomerEntity?>> getCustomerById(String customerId);

  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  Stream<Either<Failure, List<CustomerEntity>>> streamCustomers();

  /// =========================
  /// UPDATE
  /// =========================
  Future<Either<Failure, void>> updateCustomer(CustomerEntity customer);

  /// =========================
  /// DELETE
  /// =========================
  Future<Either<Failure, void>> deleteCustomer(String customerId);
}
