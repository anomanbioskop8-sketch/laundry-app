// =============================================================================
// File        : setting_page_wrapper.dart
// Path        : lib/features/setting/presentation/pages/setting_page_wrapper.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Wrapper provider untuk SettingPage
// =============================================================================

import 'package:app_laundry/app/di/injection_container.dart';

import 'package:app_laundry/features/setting/presentation/cubit/setting_cubit.dart';

import 'package:app_laundry/features/setting/presentation/pages/setting_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPageWrapper extends StatelessWidget {
  const SettingPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<SettingCubit>()..load())],

      child: const SettingPage(),
    );
  }
}
