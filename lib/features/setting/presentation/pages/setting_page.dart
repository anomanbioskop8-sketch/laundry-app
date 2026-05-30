// =============================================================================
// File        : setting_page.dart
// Path        : lib/features/setting/presentation/pages/setting_page.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Menampilkan setting aplikasi
// =============================================================================

import 'package:app_laundry/app/router/extensions/push/setting_navigation_ext.dart';
import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/setting_strings.dart';
import 'package:app_laundry/core/ui/components/app_fab.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';
import 'package:app_laundry/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:app_laundry/features/setting/presentation/widgets/setting_view.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(SettingStrings.title)),
      body: BaseStreamBuilder<SettingCubit, SettingEntity>(
        empty: AppEmptyWidget(message: SettingStrings.empty),
        builder: (data) {
          final setting = data.first;
          return SettingView(setting: setting);
        },
      ),

      floatingActionButton: BaseStreamBuilder<SettingCubit, SettingEntity>(
        builder: (data) {
          final setting = data.first;

          return AppFab(
            icon: AppIcons.edit,
            tooltip: SettingStrings.title,
            heroTag: 'fab_setting',
            onPressed: () => context.pushSettingForm(setting: setting),
          );
        },
      ),
    );
  }
}
