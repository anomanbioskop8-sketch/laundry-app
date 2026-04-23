import 'package:flutter/material.dart';
import 'dialog_type.dart';

class DialogColorMapper {
  static Color map(DialogType type) {
    switch (type) {
      case DialogType.delete:
        return Colors.red;

      case DialogType.update:
        return Colors.blue;

      case DialogType.warning:
        return Colors.orange;

      case DialogType.info:
        return Colors.green;
    }
  }
}
