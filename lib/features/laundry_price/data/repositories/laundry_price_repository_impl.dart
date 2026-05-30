import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/app_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry_price/data/datasources/laundry_price_remote_datasource.dart';
import 'package:app_laundry/features/laundry_price/data/mappers/laundry_item_mapper_ext.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';

class LaundryPriceRepositoryImpl implements LaundryPriceRepository {
  final LaundryPriceRemoteDataSource _remote;

  LaundryPriceRepositoryImpl(this._remote);

  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  @override
  Stream<Either<Failure, List<LaundryPriceEntity>>> streamByLaundryItemId({
    required String companyId,
    required String itemId,
  }) async* {
    try {
      await for (final models in _remote.streamByLaundryItemId(
        companyId: companyId,
        itemId: itemId,
      )) {
        yield Right(models.toEntities);
      }
    } on AppException catch (e) {
      yield Left(e.toFailure);
    }
  }

  @override
  Stream<Either<Failure, List<LaundryPriceEntity>>> streamByServiceAndSpeed({
    required String companyId,
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
  }) async* {
    try {
      await for (final models in _remote.streamByServiceAndSpeed(
        companyId: companyId,
        serviceType: serviceType,
        speedType: speedType,
      )) {
        yield Right(models.toEntities);
      }
    } on AppException catch (e) {
      yield Left(e.toFailure);
    }
  }

  /// =========================
  /// GET LAUNDRY PRICE
  /// =========================
  @override
  Future<Either<Failure, LaundryPriceEntity?>> getLaundryPrice({
    required String companyId,
    required String itemId,
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
  }) async {
    try {
      final model = await _remote.getLaundryPrice(
        companyId: companyId,
        itemId: itemId,
        serviceType: serviceType,
        speedType: speedType,
      );

      if (model == null) return const Right(null);

      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  /// =========================
  /// GET BY ID
  /// =========================
  @override
  Future<Either<Failure, LaundryPriceEntity?>> getById({
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
  Future<Either<Failure, void>> create({
    required String companyId,
    required LaundryPriceEntity price,
  }) async {
    try {
      final model = price.toModel;

      await _remote.create(companyId: companyId, id: model.id, data: model);

      return const Right(null);
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
    required LaundryPriceEntity price,
  }) async {
    try {
      final model = price.toModel;

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

  @override
  Future<Either<Failure, void>> deleteByItemId({
    required String companyId,
    required String itemId,
  }) async {
    try {
      await _remote.deleteByItemId(companyId: companyId, itemId: itemId);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }
}
