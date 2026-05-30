// =============================================================================
// File        : company_form_page.dart
// Path        : lib/features/company/presentation/pages/company_form_page.dart
// =============================================================================

import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/constants/strings/company_strings.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/presentation/config/company_form_config.dart';
import 'package:app_laundry/features/company/presentation/controllers/company_form_controller.dart';
import 'package:app_laundry/features/company/presentation/cubit/company_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyFormPage extends StatefulWidget {
  final CompanyEntity company;

  const CompanyFormPage({super.key, required this.company});

  @override
  State<CompanyFormPage> createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends State<CompanyFormPage> {
  // =========================
  // CONTROLLER
  // =========================

  late final CompanyFormController _controller;
  late final CompanyFormConfig _config;

  // =========================
  // INIT
  // =========================

  @override
  void initState() {
    super.initState();
    _controller = CompanyFormController();
    _config = CompanyFormConfig(_controller);
    _controller.setCompany(widget.company);
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
    await context.read<CompanyActionCubit>().submit(_controller.buildParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(CompanyStrings.edit)),
      body: FormBuilder(
        formKey: _controller.formKey,
        fields: _config.fields,
        submitLabel: CompanyStrings.save,
        onSubmit: _submit,
      ),
    );
  }
}
