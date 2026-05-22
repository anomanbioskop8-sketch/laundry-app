// =============================================================================
// File        : stream_setting.dart
// Path        : lib/features/setting/domain/usecases/stream_setting.dart
// Layer       : Domain (UseCase)
// -----------------------------------------------------------------------------
// Fungsi:
// - Stream realtime setting aplikasi berdasarkan company
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';

import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/domain/repositories/setting_repository.dart';

class StreamSetting {
  // =========================
  // DEPENDENCY
  // =========================

  final SettingRepository _repository;

  final SessionService _session;

  StreamSetting({
    required SettingRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  // =========================
  // CALL
  // =========================

  Stream<Either<Failure, SettingEntity?>> call() {
    try {
      final companyId = _session.companyId;

      return _repository.stream(companyId: companyId);
    } on UnauthorizedException catch (e) {
      return Stream.value(Left(e.failure));
    }
  }
}
