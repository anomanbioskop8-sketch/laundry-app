// =============================================================================
// File        : setting_routes.dart
// Path        : lib/app/router/routes/setting_routes.dart
// Layer       : App (Routing)
// -----------------------------------------------------------------------------
// Fungsi:
// - Routing feature Setting
// =============================================================================

import 'package:app_laundry/app/router/paths/setting_paths.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/presentation/pages/setting_form_page.dart';
import 'package:app_laundry/features/setting/presentation/wrappers/setting_form_page_wrapper.dart';

import 'package:app_laundry/features/setting/presentation/wrappers/setting_page_wrapper.dart';

import 'package:go_router/go_router.dart';

abstract final class SettingRoutes {
  // =========================
  // ROUTES
  // =========================

  static List<RouteBase> routes = [
    // =========================
    // SETTING
    // =========================
    GoRoute(
      path: SettingPaths.root,

      name: SettingPaths.settingName,

      builder: (_, _) {
        return const SettingPageWrapper();
      },
    ),

    // =========================
    // FORM
    // =========================
    GoRoute(
      path: SettingPaths.form,

      name: SettingPaths.formName,

      builder: (_, state) {
        final setting = state.extra as SettingEntity;

        return SettingFormPageWrapper(setting: setting);
      },
    ),
  ];
}
