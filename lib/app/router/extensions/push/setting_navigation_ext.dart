// =============================================================================
// File        : setting_navigation_ext.dart
// Path        : lib/app/router/extensions/setting_navigation_ext.dart
// =============================================================================

import 'package:app_laundry/app/router/paths/setting_paths.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';

extension SettingNavigationExt on BuildContext {
  // =========================
  // SETTING PAGE
  // =========================

  void goSetting() {
    goNamed(SettingPaths.setting);
  }

  // =========================
  // SETTING FORM
  // =========================

  Future<T?> pushSettingForm<T>({SettingEntity? setting}) {
    return pushNamed<T>(SettingPaths.settingForm, extra: setting);
  }
}
