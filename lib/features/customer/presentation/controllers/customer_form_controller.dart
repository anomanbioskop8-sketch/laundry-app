import 'package:app_laundry/core/base/form/form_controller.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:flutter/material.dart';

class CustomerFormController extends FormController {
  final name = TextEditingController();
  final phone = TextEditingController();

  String? _id;

  @override
  List<TextEditingController> get controllers => [name, phone];

  /// =========================
  /// SET DATA (EDIT)
  /// =========================
  void setData(CustomerEntity customer) {
    _id = customer.id;
    name.text = customer.name;
    phone.text = customer.phone;
  }

  /// =========================
  /// MODE
  /// =========================
  bool get isEdit => _id != null;

  /// =========================
  /// BUILD PARAMS
  /// =========================
  SaveCustomerParams buildParams() {
    return SaveCustomerParams(
      id: _id,
      name: name.text.trim(),
      phone: phone.text.trim(),
    );
  }
}
