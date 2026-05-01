import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';
import 'form_field_config.dart';

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
      child: Column(
        children: [
          ...fields.map((f) {
            return Padding(
              padding: EdgeInsets.only(bottom: context.spacing.md),
              child: TextFormField(
                controller: f.controller,
                keyboardType: f.keyboardType,
                obscureText: f.obscureText,
                validator: f.validate,
                autofillHints: f.autofillHints,
                decoration: InputDecoration(labelText: f.label),
              ),
            );
          }),

          context.spacing.xl.h,

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                onSubmit();
              },
              child: Text(submitLabel),
            ),
          ),
        ],
      ),
    );
  }
}
