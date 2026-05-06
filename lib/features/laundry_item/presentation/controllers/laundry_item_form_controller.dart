import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';
import 'package:flutter/material.dart';

class LaundryItemFormController extends FormController {
  final name = TextEditingController();
  final category = TextEditingController();

  String? _id;

  @override
  List<TextEditingController> get controllers => [name, category];

  /// =========================
  /// SET DATA (EDIT)
  /// =========================
  void setData(LaundryItemEntity item) {
    _id = item.id;
    name.text = item.name;
    category.text = item.category.value;
  }

  /// =========================
  /// MODE
  /// =========================
  bool get isEdit => _id != null;

  /// =========================
  /// BUILD PARAMS
  /// =========================
  SaveLaundryItemParams buildParams() {
    return SaveLaundryItemParams(
      id: _id,
      name: name.text.trim(),
      category: LaundryItemCategoryX.fromString(category.text.trim()),
    );
  }
}
