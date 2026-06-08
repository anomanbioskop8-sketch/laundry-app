import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:flutter/material.dart';
import 'dialog_type.dart';

class DialogColorMapper {
  static Color color(BuildContext context, DialogType type) {
    switch (type) {
      case DialogType.alert:
        return context.status.error;

      case DialogType.confirm:
        return context.status.info;
    }
  }
}
