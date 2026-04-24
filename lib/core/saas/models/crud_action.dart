import 'package:flutter/material.dart';

class CrudAction<T> {
  final String label;
  final IconData icon;
  final Color? color;
  final Future<void> Function(T item) onTap;

  const CrudAction({
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
  });
}
