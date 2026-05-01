// =============================================================================
// File        : app_ui_service.dart
// Path        : core/services/app_ui_service.dart
// Layer       : Core (UI Service - Facade)
// -----------------------------------------------------------------------------
// AppUIService (Facade)
//
// Responsibility:
// - Menjadi single entry point untuk semua kebutuhan UI global:
//   - Snackbar
//   - Dialog
//   - Loading Overlay
//
// - Digunakan oleh Cubit / Service layer (tanpa BuildContext).
// - Menyederhanakan penggunaan UI service (hindari import banyak service).
//
// Pattern:
// - Facade Pattern (wrapper dari beberapa service kecil)
//
// Dependencies:
// - AppSnackbar
// - DialogService
// - LoadingOverlayService
// =============================================================================

import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';

import 'snackbar_service.dart';
import 'dialog_service.dart';
import 'loading_overlay_service.dart';

class AppUIService {
  AppUIService._(); // ❌ prevent instantiation

  // ===========================================================================
  // SNACKBAR
  // ===========================================================================
  //
  // Menampilkan feedback cepat ke user
  //

  static void success(String message) {
    AppSnackbar.success(message);
  }

  static void error(String message) {
    AppSnackbar.error(message);
  }

  // ===========================================================================
  // DIALOG
  // ===========================================================================
  //
  // Digunakan untuk konfirmasi user (blocking interaction)
  //

  /// Dialog konfirmasi global
  ///
  /// Return:
  /// - true  → user confirm
  /// - false → user cancel
  static Future<bool> confirm({
    String title = 'Konfirmasi',
    String message = 'Apakah kamu yakin?',
    String cancelText = 'Batal',
    String confirmText = 'OK',
    DialogType type = DialogType.info,
    Color? confirmColor,
  }) {
    return DialogService.confirm(
      title: title,
      message: message,
      cancelText: cancelText,
      confirmText: confirmText,
      type: type,
      confirmColor: confirmColor,
    );
  }

  // ===========================================================================
  // LOADING
  // ===========================================================================
  //
  // Global blocking loading (biasanya untuk API call)
  //

  /// Tampilkan loading overlay
  static void showLoading() {
    LoadingOverlayService.show();
  }

  /// Sembunyikan loading overlay
  static void hideLoading() {
    LoadingOverlayService.hide();
  }
}
