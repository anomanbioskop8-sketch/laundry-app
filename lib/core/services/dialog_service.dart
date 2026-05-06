// =============================================================================
// File        : dialog_service.dart
// Path        : core/services/dialog_service.dart
// Layer       : Core (UI Service)
// -----------------------------------------------------------------------------
// Global Dialog Service.
//
// Responsibility:
// - Menampilkan dialog global tanpa perlu BuildContext.
// - Digunakan oleh Cubit / Service layer (misalnya BaseActionCubit).
// - Menyediakan dialog konfirmasi yang konsisten (confirm / cancel).
//
// Notes:
// - Bergantung pada AppNavigator.key.
// - Gunakan DialogType untuk menentukan warna / style.
// - Aman dipanggil dari mana saja (selama Navigator sudah siap).
// =============================================================================

import 'package:app_laundry/core/theme/dialog/dialog_ext.dart';
import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';

class DialogService {
  DialogService._(); // ❌ prevent instantiation

  // ===========================================================================
  // PUBLIC API
  // ===========================================================================

  /// Menampilkan dialog konfirmasi
  ///
  /// Return:
  /// - `true`  → user menekan tombol confirm
  /// - `false` → user cancel / dialog ditutup
  static Future<bool> confirm({
    required String title,
    required String message,

    String cancelText = 'Batal',
    String confirmText = 'OK',

    DialogType type = DialogType.info,
    Color? confirmColor,
  }) async {
    final context = AppNavigator.navigatorKey.currentContext;

    // 🔒 Safety: context belum tersedia
    if (context == null) return false;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false, // 🔒 wajib pilih aksi
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: context.radius.md.r),

          // =========================
          // CONTENT
          // =========================
          title: Row(
            children: [
              Icon(
                type.icon(),
                size: context.sizes.iconLg,
                color: type.color(context),
              ),
              context.spacing.sm.w,
              Expanded(child: Text(title)),
            ],
          ),
          content: Text(message),

          // =========================
          // ACTIONS
          // =========================
          actions: [
            /// Cancel button
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(cancelText),
            ),

            /// Confirm button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: type.color(context),
              ),
              onPressed: () => Navigator.pop(context, true),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );

    // 🔁 fallback jika null (misalnya dismiss tidak terduga)
    return result ?? false;
  }
}
