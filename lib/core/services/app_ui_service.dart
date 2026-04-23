import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:flutter/material.dart';

import 'snackbar_service.dart';
import 'dialog_service.dart';
import 'loading_overlay_service.dart';

class AppUIService {
  // SNACKBAR
  static void success(String message) => AppSnackbar.showSuccess(message);

  static void error(String message) => AppSnackbar.showError(message);

  // DIALOG
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
      type: type,
      confirmColor: confirmColor,
      cancelText: cancelText,
      confirmText: confirmText,
    );
  }

  // LOADING
  static void showLoading() => LoadingOverlayService.show();

  static void hideLoading() => LoadingOverlayService.hide();
}
