import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'dialog_type.dart';

class DialogIconMapper {
  static IconData icon(DialogType type) {
    switch (type) {
      case DialogType.confirm:
        return AppIcons.confirm;

      case DialogType.alert:
        return AppIcons.alert;
    }
  }
}
