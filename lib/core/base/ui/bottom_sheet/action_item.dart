// core/base/ui/bottom_sheet/action_item.dart

import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:flutter/material.dart';

class ActionItem {
  final String title;
  final IconData icon;
  final DialogType type;
  final VoidCallback onTap;
  final bool Function()? canShow;

  ActionItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.type = DialogType.info, // Default ke info jika tidak diber
    this.canShow,
  });
}
