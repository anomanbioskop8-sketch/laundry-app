// =============================================================================
// File        : order_repository_impl.dart
// Path        : lib/features/order/data/repositories/order_repository_impl.dart
// Layer       : Data (Repository Implementation)
// -----------------------------------------------------------------------------
// Fungsi:
// - Implementasi OrderRepository
// - Menghubungkan Domain Layer dengan Remote Data Source
// - Mapping Model <-> Entity
// - Handle exception -> failure
// =============================================================================

import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/app_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/order/data/datasources/order_remote_data_source.dart';
import 'package:app_laundry/features/order/data/mappers/order_mapper_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remote;

  const OrderRepositoryImpl(this.remote);

  // =========================
  // STREAM ALL
  // =========================

  @override
  Stream<Either<Failure, List<OrderEntity>>> streamAll(
    String companyId,
  ) async* {
    try {
      await for (final models in remote.streamAll(companyId)) {
        yield Right(models.toEntities);
      }
    } on AppException catch (e) {
      yield Left(e.toFailure);
    }
  }

  // =========================
  // GET BY ID
  // =========================

  @override
  Future<Either<Failure, OrderEntity?>> getById({
    required String companyId,
    required String id,
  }) async {
    try {
      final model = await remote.getById(companyId: companyId, id: id);

      if (model == null) {
        return const Right(null);
      }

      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  // =========================
  // CREATE
  // =========================

  @override
  Future<Either<Failure, OrderEntity>> create({
    required String companyId,
    required OrderEntity order,
  }) async {
    try {
      final model = order.toModel;

      await remote.create(companyId: companyId, id: model.id, data: model);

      return Right(order);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  // =========================
  // UPDATE
  // =========================

  @override
  Future<Either<Failure, void>> update({
    required String companyId,
    required OrderEntity order,
  }) async {
    try {
      final model = order.toModel;

      await remote.update(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  // =========================
  // DELETE
  // =========================

  @override
  Future<Either<Failure, void>> deleteById({
    required String companyId,
    required String id,
  }) async {
    try {
      await remote.delete(companyId: companyId, id: id);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }
}
