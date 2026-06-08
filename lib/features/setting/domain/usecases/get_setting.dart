// =============================================================================
// File        : get_setting.dart
// Path        : lib/features/setting/domain/usecases/get_setting.dart
// Layer       : Domain (UseCase)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengambil setting aplikasi berdasarkan company
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/errors/failure.dart';

import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/domain/repositories/setting_repository.dart';

class GetSetting {
  // =========================
  // DEPENDENCY
  // =========================

  final SettingRepository _repository;

  final SessionService _session;

  GetSetting({
    required SettingRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  // =========================
  // CALL
  // =========================

  Future<Either<Failure, SettingEntity?>> call() {
    return _repository.get(companyId: _session.companyId);
  }
}
