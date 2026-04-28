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
}
