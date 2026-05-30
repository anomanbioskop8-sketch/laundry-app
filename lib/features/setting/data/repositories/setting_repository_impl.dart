// =============================================================================
// File        : setting_repository_impl.dart
// Path        : lib/features/setting/data/repositories/setting_repository_impl.dart
// Layer       : Data
// -----------------------------------------------------------------------------
// Fungsi:
// - Implementasi repository Setting
// - Bridge datasource <-> entity
// =============================================================================

import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/app_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:app_laundry/features/setting/data/mappers/setting_mapper_ext.dart';
import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';
import 'package:app_laundry/features/setting/domain/repositories/setting_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  // =========================
  // DEPENDENCY
  // =========================

  final SettingRemoteDataSource _remote;

  SettingRepositoryImpl(this._remote);

  // =========================
  // STREAM
  // =========================

  @override
  Stream<Either<Failure, SettingEntity?>> stream({
    required String companyId,
  }) async* {
    try {
      yield* _remote.stream(companyId).map((event) => Right(event?.toEntity));
    } on AppException catch (e) {
      yield Left(e.toFailure);
    }
  }

  // =========================
  // GET
  // =========================

  @override
  Future<Either<Failure, SettingEntity?>> get({
    required String companyId,
  }) async {
    try {
      final model = await _remote.get(companyId);

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
  Future<Either<Failure, void>> create({
    required String companyId,
    required SettingEntity setting,
  }) async {
    try {
      await _remote.create(companyId: companyId, setting: setting.toModel);

      return const Right(null);
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
    required SettingEntity setting,
  }) async {
    try {
      await _remote.update(companyId: companyId, setting: setting.toModel);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }
}
