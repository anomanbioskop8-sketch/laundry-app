import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/constants/app_strings.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/features/customer/presentation/controllers/customer_form_controller.dart';

class CustomerFormConfig {
  final CustomerFormController controller;

  CustomerFormConfig(this.controller);

  /// =========================
  /// BUILD FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      FormFieldConfig(
        name: 'name',
        label: 'Nama',
        controller: controller.name,

        validators: [
          (v) => AppValidator.required(v, field: 'Nama'),
          (v) => AppValidator.minLength(v, 3, field: 'Nama'),
        ],
      ),
      FormFieldConfig(
        name: 'phone',
        label: 'No HP',
        controller: controller.phone,
        type: FormFieldType.number,
        validators: [AppValidator.phone],
      ),
      FormFieldConfig(
        name: 'address',
        label: 'Alamat',
        controller: controller.address,
        type: FormFieldType.multiline,
        validators: [(v) => AppValidator.required(v, field: 'Alamat')],
      ),
    ];
  }

  /// =========================
  /// SUBMIT LABEL
  /// =========================
  String get submitLabel {
    return controller.isEdit ? AppStrings.edit : AppStrings.add;
  }
}
