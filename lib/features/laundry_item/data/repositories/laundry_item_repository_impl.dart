import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/app_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/data/datasources/laundry_item_remote_datasource.dart';
import 'package:app_laundry/features/laundry_item/data/mappers/laundry_item_mapper_ext.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';

class LaundryItemRepositoryImpl implements LaundryItemRepository {
  final LaundryItemRemoteDataSource _remote;

  LaundryItemRepositoryImpl(this._remote);

  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  @override
  Stream<Either<Failure, List<LaundryItemEntity>>> streamAll(
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
  /// GET BY ID
  /// =========================
  @override
  Future<Either<Failure, LaundryItemEntity?>> getById({
    required String companyId,
    required String id,
  }) async {
    try {
      final model = await _remote.getById(companyId: companyId, id: id);

      if (model == null) return const Right(null);

      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  /// =========================
  /// CREATE
  /// =========================
  @override
  Future<Either<Failure, LaundryItemEntity>> create({
    required String companyId,
    required LaundryItemEntity item,
  }) async {
    try {
      final model = item.toModel;

      await _remote.create(companyId: companyId, id: model.id, data: model);

      return Right(item);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  /// =========================
  /// UPDATE
  /// =========================
  @override
  Future<Either<Failure, void>> update({
    required String companyId,
    required LaundryItemEntity item,
  }) async {
    try {
      final model = item.toModel;

      await _remote.update(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  /// =========================
  /// DELETE
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
