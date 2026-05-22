// =============================================================================
// File        : setting_fab.dart
// Path        : lib/features/setting/presentation/widgets/setting_fab.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Floating action button untuk edit setting
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:flutter/material.dart';

class SettingFab extends StatelessWidget {
  // =========================
  // DATA
  // =========================

  final SettingEntity setting;

  final VoidCallback onTap;

  const SettingFab({super.key, required this.setting, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,

      child: const Icon(AppIcons.edit),
    );
  }
}
