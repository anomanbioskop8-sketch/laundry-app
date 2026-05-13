import 'package:app_laundry/core/base/form/fields/checkbox_field_widget.dart';
import 'package:app_laundry/core/base/form/fields/date_field_widget.dart';
import 'package:app_laundry/core/base/form/fields/dropdown_field_widget.dart';
import 'package:app_laundry/core/base/form/fields/text_field_widget.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
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
      child: Column(
        children: [
          ...fields.map((f) {
            return Padding(
              padding: EdgeInsets.only(bottom: context.spacing.lg),
              child: _buildField(f),
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

  Widget _buildField(FormFieldConfig f) {
    /// 🔥 custom builder override (super powerful)
    if (f.builder != null) {
      return f.builder!(f);
    }

    switch (f.type) {
      case FormFieldType.text:
      case FormFieldType.email:
      case FormFieldType.number:
      case FormFieldType.password:
      case FormFieldType.multiline:
        return TextFieldWidget(field: f);

      case FormFieldType.dropdown:
        return DropdownFieldWidget(field: f);

      case FormFieldType.date:
        return DateFieldWidget(field: f);

      case FormFieldType.checkbox:
        return CheckboxFieldWidget(field: f);
    }
  }
}
