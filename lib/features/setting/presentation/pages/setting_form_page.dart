// =============================================================================
// File        : setting_form_page.dart
// Path        : lib/features/setting/presentation/pages/setting_form_page.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Form update setting aplikasi
// =============================================================================

import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';

import 'package:app_laundry/core/constants/strings/setting_strings.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/presentation/config/setting_form_config.dart';

import 'package:app_laundry/features/setting/presentation/controllers/setting_form_controller.dart';

import 'package:app_laundry/features/setting/presentation/cubit/setting_action_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SettingFormPage extends StatefulWidget {
  // =========================
  // DATA
  // =========================

  final SettingEntity setting;

  const SettingFormPage({super.key, required this.setting});

  @override
  State<SettingFormPage> createState() {
    return _SettingFormPageState();
  }
}

class _SettingFormPageState extends State<SettingFormPage> {
  // =========================
  // CONTROLLER
  // =========================

  late final SettingFormController _controller;

  late final SettingFormConfig _config;

  // =========================
  // INIT
  // =========================

  @override
  void initState() {
    super.initState();

    _controller = SettingFormController();

    _config = SettingFormConfig(_controller);

    _controller.setSetting(widget.setting);
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  // =========================
  // SUBMIT
  // =========================

  Future<void> _submit() async {
    await context.read<SettingActionCubit>().submit(_controller.buildParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(SettingStrings.title)),

      body: FormBuilder(
        formKey: _controller.formKey,

        fields: _config.fields,

        submitLabel: 'Simpan',

        onSubmit: _submit,
      ),
    );
  }
}
