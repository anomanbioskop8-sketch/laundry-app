// =============================================================================
// File        : setting_page.dart
// Path        : lib/features/setting/presentation/pages/setting_page.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Menampilkan setting aplikasi
// =============================================================================

import 'package:app_laundry/app/router/paths/setting_paths.dart';

import 'package:app_laundry/core/base/builders/base_stream_builder.dart';

import 'package:app_laundry/core/constants/strings/setting_strings.dart';

import 'package:app_laundry/core/ui/states/app_empty_widget.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/presentation/cubit/setting_cubit.dart';

import 'package:app_laundry/features/setting/presentation/widgets/setting_fab.dart';

import 'package:app_laundry/features/setting/presentation/widgets/setting_view.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

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

          return SettingFab(
            setting: setting,

            onTap: () async {
              await context.pushNamed(SettingPaths.formName, extra: setting);
            },
          );
        },
      ),
    );
  }
}
