import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

abstract class CustomerRepository {
  /// =========================
  /// CREATE
  /// =========================
  Future<Either<Failure, void>> createCustomer({
    required String companyId,
    required CustomerEntity customer,
  });

  /// =========================
  /// GET SINGLE
  /// =========================
  Future<Either<Failure, CustomerEntity?>> getCustomerById({
    required String companyId,
    required String customerId,
  });

  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  Stream<Either<Failure, List<CustomerEntity>>> streamCustomers(
    String companyId,
  );

  /// =========================
  /// UPDATE
  /// =========================
  Future<Either<Failure, void>> updateCustomer({
    required String companyId,
    required CustomerEntity customer,
  });

  /// =========================
  /// DELETE
  /// =========================
  Future<Either<Failure, void>> deleteCustomer({
    required String companyId,
    required String customerId,
  });
}
