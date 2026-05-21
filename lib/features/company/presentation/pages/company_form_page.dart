// =============================================================================
// File        : company_form_page.dart
// Path        : lib/features/company/presentation/pages/company_form_page.dart
// =============================================================================

import 'package:app_laundry/core/base/form/form_builder.dart';

import 'package:app_laundry/core/constants/strings/app_strings.dart';

import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

import 'package:app_laundry/features/company/presentation/config/company_form_config.dart';

import 'package:app_laundry/features/company/presentation/controllers/company_form_controller.dart';
import 'package:app_laundry/features/company/presentation/cubit/company_action_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyFormPage extends StatefulWidget {
  final CompanyEntity? company;

  const CompanyFormPage({super.key, this.company});

  @override
  State<CompanyFormPage> createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends State<CompanyFormPage> {
  final controller = CompanyFormController();

  @override
  void initState() {
    super.initState();

    if (widget.company != null) {
      controller.setCompany(widget.company!);
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompanyActionCubit>();
    final config = CompanyFormConfig(controller);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Company')),

      body: FormBuilder(
        formKey: controller.formKey,
        fields: config.fields,
        submitLabel: AppStrings.save,
        onSubmit: () {
          cubit.submit(controller.buildParams());
        },
      ),
    );
  }
}
