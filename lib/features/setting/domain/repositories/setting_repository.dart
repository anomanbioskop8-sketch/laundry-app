// =============================================================================
// File        : setting_repository.dart
// Path        : lib/features/setting/domain/repositories/setting_repository.dart
// Layer       : Domain (Repository Contract)
// -----------------------------------------------------------------------------
// Fungsi:
// - Kontrak repository untuk setting aplikasi
// =============================================================================

import 'package:app_laundry/core/errors/failure.dart';

import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

abstract interface class SettingRepository {
  // =========================
  // GET
  // =========================

  Future<Either<Failure, SettingEntity?>> get({required String companyId});

  // =========================
  // STREAM
  // =========================

  Stream<Either<Failure, SettingEntity?>> stream({required String companyId});

  // =========================
  // CREATE
  // =========================

  Future<Either<Failure, void>> create({
    required String companyId,
    required SettingEntity setting,
  });

  // =========================
  // UPDATE
  // =========================

  Future<Either<Failure, void>> update({
    required String companyId,
    required SettingEntity setting,
  });
}
