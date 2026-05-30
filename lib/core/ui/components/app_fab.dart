// =============================================================================
// File        : app_fab.dart
// Path        : lib/core/widgets/buttons/app_fab.dart
// Layer       : Core
// -----------------------------------------------------------------------------
// Fungsi:
// - Global FloatingActionButton
// - Konsisten untuk seluruh aplikasi
// =============================================================================

import 'package:flutter/material.dart';

class AppFab extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String? heroTag;
  final String? tooltip;

  const AppFab({
    super.key,
    required this.onPressed,
    required this.icon,
    this.heroTag,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      tooltip: tooltip,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
