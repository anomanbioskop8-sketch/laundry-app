// =============================================================================
// File        : form_builder.dart
// Path        : lib/core/base/form/form_builder.dart
// Layer       : Presentation (Form)
// -----------------------------------------------------------------------------
// Fungsi:
// - Builder global untuk form aplikasi
// - Menangani:
//   - rendering field
//   - validasi form
//   - submit action
//   - custom field validation
// - Mendukung field custom dengan validator manual
// =============================================================================

import 'package:app_laundry/core/base/form/app_form_field_renderer.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_elevated_action_button.dart';
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
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.lg,
          vertical: context.spacing.xl,
        ),

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

            context.spacing.lg.h,

            // =========================
            // SUBMIT BUTTON
            // =========================
            SizedBox(
              width: double.infinity,

              child: AppElevatedActionButton(
                label: submitLabel,
                onPressed: () {
                  // =========================
                  // DEFAULT FORM VALIDATION
                  // =========================

                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  // =========================
                  // CUSTOM FIELD VALIDATION
                  // =========================

                  for (final field in fields) {
                    final error = field.validateValue();

                    if (error != null) {
                      AppUIService.error(error);

                      return;
                    }
                  }

                  // =========================
                  // SUBMIT
                  // =========================

                  try {
                    onSubmit();
                  } on ValidationException catch (e) {
                    AppUIService.error(e.message);
                  } catch (e) {
                    AppUIService.error(e.toString());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
