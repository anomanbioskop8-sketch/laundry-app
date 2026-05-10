import 'package:app_laundry/core/base/form/fields/form_option.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/core/constants/laundry_item_strings.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/laundry_item/presentation/controllers/laundry_item_form_controller.dart';

class LaundryItemFormConfig {
  final LaundryItemFormController controller;

  LaundryItemFormConfig(this.controller);

  /// =========================
  /// BUILD FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      FormFieldConfig(
        name: 'name',
        label: LaundryItemStrings.name,
        controller: controller.name,

        validators: [
          (v) => AppValidator.required(v, field: 'Nama'),
          (v) => AppValidator.minLength(v, 3, field: 'Nama'),
        ],
      ),
      FormFieldConfig(
        name: 'category',
        label: LaundryItemStrings.category,
        initialValue: true,
        type: FormFieldType.dropdown,
        controller: controller.category,
        options: LaundryItemCategory.values
            .map(
              (e) => FormOption(value: e.value, label: e.label, icon: e.icon),
            )
            .toList(),
        validators: [(v) => AppValidator.required(v, field: 'Kategori')],
      ),
    ];
  }

  /// =========================
  /// SUBMIT LABEL
  /// =========================
  String get submitLabel {
    return controller.isEdit ? LaundryItemStrings.edit : LaundryItemStrings.add;
  }
}
