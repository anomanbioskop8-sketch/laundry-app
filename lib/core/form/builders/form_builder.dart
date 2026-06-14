// =============================================================================
// File        : form_builder.dart
// Path        : lib/core/form/builders/form_builder.dart
// =============================================================================

import 'package:app_laundry/core/constants/strings/app_strings.dart';
import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:app_laundry/core/form/helpers/form_submit_helper.dart';
import 'package:app_laundry/core/form/renderers/app_form_field_renderer.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_elevated_action_button.dart';
import 'package:flutter/material.dart';

typedef AsyncCallback = Future<void> Function();

class FormBuilder extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<FormFieldConfig> fields;
  final AsyncCallback onSubmit;
  final String submitLabel;
  final bool showSubmitButton;

  const FormBuilder({
    super.key,
    required this.formKey,
    required this.fields,
    required this.onSubmit,
    this.submitLabel = AppStrings.save,
    this.showSubmitButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.md,
          vertical: context.spacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // FIELDS
            // =========================
            ...fields.map(
              (field) => Padding(
                padding: EdgeInsets.only(bottom: context.spacing.md),
                child: AppFormFieldRenderer.build(field),
              ),
            ),

            // =========================
            // SUBMIT BUTTON
            // =========================
            if (showSubmitButton) ...[
              context.spacing.md.h,

              SizedBox(
                width: double.infinity,
                child: AppElevatedActionButton(
                  label: submitLabel,
                  onPressed: () {
                    FormSubmitHelper.submit(
                      formKey: formKey,
                      fields: fields,
                      onSubmit: onSubmit,
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
