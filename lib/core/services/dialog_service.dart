import 'package:flutter/material.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/core/theme/dialog/dialog_color_mapper.dart';

class DialogService {
  static Future<bool> confirm({
    required String title,
    required String message,
    String cancelText = 'Batal',
    String confirmText = 'OK',
    DialogType type = DialogType.info,
    Color? confirmColor,
  }) async {
    final context = AppNavigator.key.currentContext;
    if (context == null) return false;

    final color = confirmColor ?? DialogColorMapper.primary(context, type);
    final bg = DialogColorMapper.background(context, type);

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(cancelText),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: color),
              onPressed: () => Navigator.pop(context, true),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
