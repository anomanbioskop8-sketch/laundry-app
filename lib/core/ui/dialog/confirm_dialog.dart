import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/dialog/dialog_ext.dart';
import 'package:app_laundry/core/ui/dialog/dialog_type.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_elevated_action_button.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_outlined_action_button.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final DialogType type;
  final String confirmText;
  final String cancelText;
  final Color? confirmColor;

  const ConfirmDialog({
    super.key,
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
      insetPadding: EdgeInsets.all(spacing.xl),

      // =========================
      // SHAPE
      // =========================
      shape: RoundedRectangleBorder(borderRadius: context.radius.md.r),

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.lg,
        ),

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

                spacing.sm.w,

                Expanded(
                  child: Text(
                    title,
                    style: context.text.titleMedium?.semiBold.copyWith(
                      color: type.color(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            spacing.md.h,

            // =========================
            // MESSAGE
            // =========================
            Text(message, style: context.text.bodyMedium),

            spacing.lg.h,

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
