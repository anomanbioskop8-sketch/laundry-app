// =============================================================================
// File        : update_setting.dart
// Path        : lib/features/setting/domain/usecases/update_setting.dart
// Layer       : Domain (UseCase)
// -----------------------------------------------------------------------------
// Fungsi:
// - Update setting aplikasi
// =============================================================================

import 'package:app_laundry/core/error/failure.dart';

import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/setting/domain/extensions/setting_params_ext.dart';

import 'package:app_laundry/features/setting/domain/repositories/setting_repository.dart';

import 'package:app_laundry/features/setting/domain/usecases/setting_params.dart';

class UpdateSetting {
  // =========================
  // DEPENDENCY
  // =========================

  final SettingRepository _repository;

  UpdateSetting(this._repository);

  // =========================
  // CALL
  // =========================

  Future<Either<Failure, void>> call({
    required String companyId,
    required SettingParams params,
  }) {
    return _repository.update(companyId: companyId, setting: params.toEntity);
  }
}
