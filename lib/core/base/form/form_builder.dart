import 'package:app_laundry/core/base/form/app_form_field_renderer.dart';

import 'package:app_laundry/core/base/form/form_field_config.dart';

import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';

import 'package:app_laundry/core/theme/helpers/theme_ext.dart';

import 'package:flutter/material.dart';

class FormBuilder extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final List<FormFieldConfig> fields;

  final VoidCallback onSubmit;

  final String submitLabel;

  const FormBuilder({
    super.key,

    required this.formKey,

    required this.fields,

    required this.onSubmit,

    this.submitLabel = 'Submit',
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,

      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // =========================
            // FIELDS
            // =========================
            ...fields.map((f) {
              return Padding(
                padding: EdgeInsets.only(bottom: context.spacing.lg),

                child: AppFormFieldRenderer.build(f),
              );
            }),

            context.spacing.xl.h,

            // =========================
            // SUBMIT BUTTON
            // =========================
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  onSubmit();
                },

                child: Text(submitLabel),
              ),
            ),

            context.spacing.xl.h,
          ],
        ),
      ),
    );
  }
}
