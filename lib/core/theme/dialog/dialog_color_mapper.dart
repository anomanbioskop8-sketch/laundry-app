import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:flutter/material.dart';
import 'dialog_type.dart';

class DialogColorMapper {
  static Color primary(BuildContext context, DialogType type) {
    switch (type) {
      case DialogType.delete:
        return context.status.error;

      case DialogType.update:
        return context.status.info;

      case DialogType.warning:
        return context.status.warning;

      case DialogType.info:
        return context.status.success;
    }
  }

  static Color background(BuildContext context, DialogType type) {
    switch (type) {
      case DialogType.delete:
        return context.status.error.withOpacity(0.1);

      case DialogType.update:
        return context.status.info.withOpacity(0.1);

      case DialogType.warning:
        return context.status.warning.withOpacity(0.1);

      case DialogType.info:
        return context.status.success.withOpacity(0.1);
    }
  }
}
