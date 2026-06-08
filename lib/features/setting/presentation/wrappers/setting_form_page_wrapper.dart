// =============================================================================
// File        : setting_form_page_wrapper.dart
// Path        : lib/features/setting/presentation/pages/setting_form_page_wrapper.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Wrapper provider untuk SettingFormPage
// =============================================================================

import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/action/base_action_listener.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/presentation/cubit/setting_action_cubit.dart';

import 'package:app_laundry/features/setting/presentation/pages/setting_form_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SettingFormPageWrapper extends StatelessWidget {
  // =========================
  // DATA
  // =========================

  final SettingEntity setting;

  const SettingFormPageWrapper({super.key, required this.setting});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<SettingActionCubit>())],

      child: BaseActionListener<SettingActionCubit, void>(
        popOnSuccess: true,
        child: SettingFormPage(setting: setting),
      ),
    );
  }
}
