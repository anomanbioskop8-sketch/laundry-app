// =============================================================================
// File        : setting_action_cubit.dart
// Path        : lib/features/setting/presentation/cubit/setting_action_cubit.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Handle update setting aplikasi
// =============================================================================

import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';

import 'package:app_laundry/core/base/action/base_action_cubit.dart';

import 'package:app_laundry/core/constants/strings/setting_strings.dart';

import 'package:app_laundry/features/setting/domain/usecases/setting_params.dart';

import 'package:app_laundry/features/setting/domain/usecases/update_setting.dart';

class SettingActionCubit extends BaseActionCubit<void> {
  // =========================
  // DEPENDENCY
  // =========================

  final UpdateSetting _update;

  final SessionCubit _session;

  SettingActionCubit({
    required UpdateSetting update,
    required SessionCubit session,
  }) : _update = update,
       _session = session;

  // =========================
  // SUBMIT
  // =========================

  Future<void> submit(SettingParams params) async {
    await execute(
      call: () {
        return _update(companyId: _session.companyId, params: params);
      },

      successMessage: SettingStrings.updateSuccess,
    );
  }
}
