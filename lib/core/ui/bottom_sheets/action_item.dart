// core/base/ui/bottom_sheet/action_item.dart

import 'package:app_laundry/core/ui/bottom_sheets/action_intent.dart';
import 'package:flutter/material.dart';

class ActionItem {
  final String title;
  final IconData icon;
  final ActionIntent intent;
  final VoidCallback onTap;
  final bool Function()? canShow;

  ActionItem({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.intent, // Default ke info jika tidak diber
    this.canShow,
  });
}
