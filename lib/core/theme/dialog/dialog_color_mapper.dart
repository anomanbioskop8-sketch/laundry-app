import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';
import 'dialog_type.dart';

class DialogColorMapper {
  static Color color(BuildContext context, DialogType type) {
    switch (type) {
      case DialogType.info:
        return context.status.info;

      case DialogType.success:
        return context.status.success;

      case DialogType.warning:
        return context.status.warning;

      case DialogType.danger:
        return context.status.error;
    }
  }
}
