import 'package:flutter/material.dart';

class ActionConfig<T> {
  final String label;
  final IconData icon;
  final Future<void> Function(BuildContext context, T item) onTap;

  const ActionConfig({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}
