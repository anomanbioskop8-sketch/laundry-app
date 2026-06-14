// =============================================================================
// File        : dialog_service.dart
// Path        : lib/core/services/dialog_service.dart
// Layer       : Core (UI Service)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menampilkan dialog global tanpa perlu BuildContext
// - Digunakan oleh Cubit / Service layer
// - Menyediakan dialog konfirmasi yang konsisten
//
// Features:
// - Global access via AppNavigator
// - Support semantic dialog type
// - Responsive spacing & radius
// - Consistent action button layout
// =============================================================================

import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/core/ui/dialog/confirm_dialog.dart';
import 'package:app_laundry/core/ui/dialog/dialog_type.dart';
import 'package:flutter/material.dart';

class DialogService {
  DialogService._();

  // ===========================================================================
  // CONFIRM DIALOG
  // ===========================================================================

  static Future<bool> confirm({
    required String title,
    required String message,
    DialogType type = DialogType.confirm,
    String confirmText = 'OK',
    String cancelText = 'Batal',
    Color? confirmColor,
  }) async {
    final context = AppNavigator.navigatorKey.currentContext;

    // 🔒 Navigator belum siap
    if (context == null) {
      return false;
    }

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,

      builder: (_) {
        return ConfirmDialog(
          title: title,
          message: message,
          type: type,
          confirmText: confirmText,
          cancelText: cancelText,
          confirmColor: confirmColor,
        );
      },
    );

    return result ?? false;
  }
}

// =============================================================================
// INTERNAL DIALOG
// =============================================================================
