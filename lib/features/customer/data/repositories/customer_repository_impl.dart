// =============================================================================
// File        : customer_repository_impl.dart
// Path        : lib/features/customer/data/repositories/customer_repository_impl.dart
// Layer       : Data (Repository Implementation)
// -----------------------------------------------------------------------------
// Fungsi:
// - Implementasi CustomerRepository
// - Menghubungkan Domain Layer dengan Remote Data Source
// - Melakukan mapping antara Entity dan Model
// - Menangani operasi:
//   - get customer by id
//   - stream customer realtime
//   - create customer
//   - update customer
//   - delete customer
// - Mengubah AppException menjadi Failure menggunakan FailureMapper
// =============================================================================

import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/app_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/data/datasources/customer_remote_data_source.dart';
import 'package:app_laundry/features/customer/data/mappers/customer_mapper_ext.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource _remote;

  CustomerRepositoryImpl(this._remote);

  /// =========================
  /// STREAM CUSTOMERS (REALTIME)
  /// =========================
  @override
  Stream<Either<Failure, List<CustomerEntity>>> streamAll(
    String companyId,
  ) async* {
    try {
      await for (final models in _remote.streamAll(companyId)) {
        yield Right(models.toEntities);
      }
    } on AppException catch (e) {
      yield Left(e.toFailure);
    }
  }

  /// =========================
  /// GET CUSTOMER BY ID
  /// =========================
  @override
  Future<Either<Failure, CustomerEntity?>> getById({
    required String companyId,
    required String id,
  }) async {
    try {
      final model = await _remote.getById(companyId: companyId, id: id);

      if (model == null) {
        return const Right(null);
      }

      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> getByIds({
    required String companyId,
    required List<String> ids,
  }) async {
    try {
      final models = await _remote.getByIds(companyId: companyId, ids: ids);

      return Right(models.toEntities);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  /// =========================
  /// CREATE CUSTOMER
  /// =========================
  @override
  Future<Either<Failure, void>> create({
    required String companyId,
    required CustomerEntity customer,
  }) async {
    try {
      final model = customer.toModel;

      await _remote.create(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  /// =========================
  /// UPDATE CUSTOMER
  /// =========================
  @override
  Future<Either<Failure, void>> update({
    required String companyId,
    required CustomerEntity customer,
  }) async {
    try {
      final model = customer.toModel;

      await _remote.update(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  /// =========================
  /// DELETE CUSTOMER
  /// =========================
  @override
  Future<Either<Failure, void>> deleteById({
    required String companyId,
    required String id,
  }) async {
    try {
      await _remote.delete(companyId: companyId, id: id);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }
}
