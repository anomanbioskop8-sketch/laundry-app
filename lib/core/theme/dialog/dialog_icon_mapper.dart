import 'package:flutter/material.dart';
import 'dialog_type.dart';

class DialogIconMapper {
  static IconData icon(DialogType type) {
    switch (type) {
      case DialogType.info:
        return Icons.info_outline;

      case DialogType.success:
        return Icons.check_circle_outline;

      case DialogType.warning:
        return Icons.warning_amber_outlined;

      case DialogType.danger:
        return Icons.error_outline;
    }
  }
}
