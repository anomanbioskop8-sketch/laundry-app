import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/error/mappers/failure_mapper.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/data/datasources/laundry_item_remote_datasource.dart';
import 'package:app_laundry/features/laundry_item/data/datasources/mappers/laundry_item_mapper.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';

class LaundryItemRepositoryImpl implements LaundryItemRepository {
  final LaundryItemRemoteDataSource remote;

  LaundryItemRepositoryImpl(this.remote);

  /// =========================
  /// CREATE
  /// =========================
  @override
  Future<Either<Failure, void>> createLaundryItem({
    required String companyId,
    required LaundryItemEntity item,
  }) async {
    try {
      final model = LaundryItemMapper.toModel(item);

      await remote.create(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// GET BY ID
  /// =========================
  @override
  Future<Either<Failure, LaundryItemEntity?>> getLaundryItemById({
    required String companyId,
    required String itemId,
  }) async {
    try {
      final model = await remote.getById(companyId: companyId, id: itemId);

      if (model == null) return const Right(null);

      return Right(LaundryItemMapper.toEntity(model));
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  @override
  Stream<Either<Failure, List<LaundryItemEntity>>> streamLaundryItems(
    String companyId,
  ) async* {
    try {
      await for (final models in remote.streamAll(companyId)) {
        final entities = models.map(LaundryItemMapper.toEntity).toList();

        yield Right(entities);
      }
    } on AppException catch (e) {
      yield Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// UPDATE
  /// =========================
  @override
  Future<Either<Failure, void>> updateLaundryItem({
    required String companyId,
    required LaundryItemEntity item,
  }) async {
    try {
      final model = LaundryItemMapper.toModel(item);

      await remote.update(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// DELETE
  /// =========================
  @override
  Future<Either<Failure, void>> deleteLaundryItem({
    required String companyId,
    required String itemId,
  }) async {
    try {
      await remote.delete(companyId: companyId, id: itemId);
      return const Right(null);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }
}
