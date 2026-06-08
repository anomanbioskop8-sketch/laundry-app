// =============================================================================
// File        : setting_view.dart
// Path        : lib/features/setting/presentation/widgets/setting_view.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Menampilkan detail setting aplikasi
// =============================================================================

import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/cards/info_card/app_info_card.dart';
import 'package:app_laundry/core/ui/widgets/cards/info_card/app_info_item.dart';
import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';
import 'package:app_laundry/features/setting/domain/extensions/setting_entity_ext.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  // =========================
  // DATA
  // =========================

  final SettingEntity setting;

  const SettingView({super.key, required this.setting});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.lg),

      child: AppInfoCard(
        items: [
          // =========================
          // REGULAR PRICE
          // =========================
          AppInfoItem(
            icon: Icons.attach_money,
            label: 'Harga Regular',
            value: setting.formattedRegularPrice,
          ),

          // =========================
          // EXPRESS PRICE
          // =========================
          AppInfoItem(
            icon: Icons.flash_on,
            label: 'Harga Express',
            value: setting.formattedExpressPrice,
          ),

          // =========================
          // REGULAR ESTIMATION
          // =========================
          AppInfoItem(
            icon: Icons.schedule,
            label: 'Estimasi Regular',
            value: setting.formattedRegularEstimation,
          ),

          // =========================
          // EXPRESS ESTIMATION
          // =========================
          AppInfoItem(
            icon: Icons.timer,
            label: 'Estimasi Express',
            value: setting.formattedExpressEstimation,
          ),
        ],
      ),
    );
  }
}
