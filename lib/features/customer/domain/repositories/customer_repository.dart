import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

abstract class CustomerRepository {
  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  Stream<Either<Failure, List<CustomerEntity>>> streamAll(String companyId);

  /// =========================
  /// GET SINGLE
  /// =========================
  Future<Either<Failure, CustomerEntity?>> getById({
    required String companyId,
    required String id,
  });

  /// =========================
  /// CREATE
  /// =========================
  Future<Either<Failure, void>> create({
    required String companyId,
    required CustomerEntity customer,
  });

  /// =========================
  /// UPDATE
  /// =========================
  Future<Either<Failure, void>> update({
    required String companyId,
    required CustomerEntity customer,
  });

  /// =========================
  /// DELETE
  /// =========================
  Future<Either<Failure, void>> deleteById({
    required String companyId,
    required String id,
  });
}
