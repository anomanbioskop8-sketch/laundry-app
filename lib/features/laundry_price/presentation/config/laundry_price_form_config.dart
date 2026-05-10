import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/core/constants/laundry_price_strings.dart';
import 'package:app_laundry/features/laundry_price/presentation/controllers/laundry_price_form_controller.dart';

class LaundryPriceFormConfig {
  final LaundryPriceFormController controller;

  LaundryPriceFormConfig(this.controller);

  /// =========================
  /// BUILD FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      FormFieldConfig(
        name: 'harga',
        label: LaundryPriceStrings.price,
        type: FormFieldType.number,
        controller: controller.price,

        validators: [(v) => AppValidator.required(v, field: 'Harga')],
      ),
    ];
  }

  /// =========================
  /// SUBMIT LABEL
  /// =========================
  String get submitLabel {
    return controller.isEdit
        ? LaundryPriceStrings.edit
        : LaundryPriceStrings.add;
  }
}
