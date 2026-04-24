// =============================================================================
// File        : base_action_item.dart
// Layer       : Presentation (UI Model)
// =============================================================================

import 'package:flutter/material.dart';

class BaseActionItem {
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const BaseActionItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
  });
}
