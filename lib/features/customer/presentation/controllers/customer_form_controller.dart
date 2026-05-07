// =============================================================================
// File        : customer_form_controller.dart
// Path        : lib/features/customer/presentation/controllers/customer_form_controller.dart
// Layer       : Presentation (Form Controller)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengelola state input form customer
// - Menyediakan TextEditingController untuk setiap field
// - Mengisi data form saat mode edit
// - Menentukan mode form (create atau edit)
// - Membangun `SaveCustomerParams` dari input form
// - Mengelola lifecycle controller melalui FormController
// =============================================================================

import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:flutter/material.dart';

class CustomerFormController extends FormController {
  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  String? _id;

  @override
  List<TextEditingController> get controllers => [name, phone, address];

  /// =========================
  /// SET FORM DATA
  /// =========================
  /// Mengisi data customer ke form saat mode edit
  void setData(CustomerEntity customer) {
    _id = customer.id;

    name.text = customer.name;
    phone.text = customer.phone;
    address.text = customer.address;
  }

  /// =========================
  /// FORM MODE
  /// =========================
  /// Menentukan apakah form dalam mode edit
  bool get isEdit => _id != null;

  /// =========================
  /// BUILD PARAMS
  /// =========================
  /// Membentuk parameter untuk proses simpan customer
  SaveCustomerParams buildParams() {
    return SaveCustomerParams(
      id: _id,
      name: name.text.trim(),
      phone: phone.text.trim(),
      address: address.text.trim(),
    );
  }
}
