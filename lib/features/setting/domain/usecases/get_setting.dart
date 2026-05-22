// =============================================================================
// File        : get_setting.dart
// Path        : lib/features/setting/domain/usecases/get_setting.dart
// Layer       : Domain (UseCase)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengambil setting aplikasi berdasarkan company
// =============================================================================

import 'package:app_laundry/core/error/failure.dart';

import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/domain/repositories/setting_repository.dart';

class GetSetting {
  // =========================
  // DEPENDENCY
  // =========================

  final SettingRepository _repository;

  GetSetting(this._repository);

  // =========================
  // CALL
  // =========================

  Future<Either<Failure, SettingEntity?>> call({required String companyId}) {
    return _repository.get(companyId: companyId);
  }
}
