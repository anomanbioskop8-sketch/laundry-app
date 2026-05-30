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
import 'package:app_laundry/core/theme/dialog/dialog_ext.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_elevated_action_button.dart';
import 'package:app_laundry/core/ui/components/app_outlined_action_button.dart';
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
        return _ConfirmDialog(
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

class _ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final DialogType type;
  final String confirmText;
  final String cancelText;
  final Color? confirmColor;

  const _ConfirmDialog({
    required this.title,
    required this.message,
    required this.type,
    required this.confirmText,
    required this.cancelText,
    this.confirmColor,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Dialog(
      // =========================
      // LAYOUT
      // =========================
      insetPadding: EdgeInsets.symmetric(
        horizontal: spacing.xl,
        vertical: spacing.xl,
      ),

      // =========================
      // SHAPE
      // =========================
      shape: RoundedRectangleBorder(borderRadius: context.radius.md.r),

      child: Padding(
        padding: EdgeInsets.all(spacing.xl),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // =========================
            // HEADER
            // =========================
            Row(
              children: [
                Icon(
                  type.icon(),
                  size: context.sizes.iconLg,
                  color: type.color(context),
                ),

                spacing.md.w,

                Expanded(
                  child: Text(
                    title,
                    style: context.titleLarge?.copyWith(
                      color: type.color(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            spacing.lg.h,

            // =========================
            // MESSAGE
            // =========================
            Text(message),

            spacing.xl.h,

            // =========================
            // ACTIONS
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // CANCEL
                AppOutlinedActionButton(
                  label: cancelText,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),

                spacing.sm.w,

                // CONFIRM
                AppElevatedActionButton(
                  label: confirmText,
                  color: confirmColor ?? type.color(context),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
