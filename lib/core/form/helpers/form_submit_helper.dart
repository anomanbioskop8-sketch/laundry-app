import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:flutter/material.dart';

typedef AsyncCallback = Future<void> Function();

abstract final class FormSubmitHelper {
  static Future<void> submit({
    required GlobalKey<FormState> formKey,
    required List<FormFieldConfig> fields,
    required AsyncCallback onSubmit,
  }) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    for (final field in fields) {
      final error = field.validateValue();

      if (error != null) {
        AppUIService.error(error);
        return;
      }
    }

    try {
      await onSubmit();
    } on ValidationException catch (e) {
      AppUIService.error(e.message);
    } catch (e) {
      AppUIService.error(e.toString());
    }
  }
}
