// =====================================================================
// File        : company_form_controller.dart
// Path        : lib/features/company/presentation/controllers/company_form_controller.dart
// =====================================================================

import 'package:app_laundry/core/form/controllers/form_controller.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/domain/usecases/company_params.dart';
import 'package:flutter/material.dart';

class CompanyFormController extends FormController {
  // =========================
  // CONTROLLERS
  // =========================

  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  // =========================
  // ENTITY
  // =========================

  late CompanyEntity _company;

  // =========================
  // FORM CONTROLLERS
  // =========================

  @override
  List<TextEditingController> get controllers {
    return [name, phone, address];
  }

  // =========================
  // SET DATA
  // =========================

  void setCompany(CompanyEntity company) {
    _company = company;

    name.text = company.name;
    phone.text = company.phone;
    address.text = company.address;
  }

  // =========================
  // BUILD PARAMS
  // =========================

  CompanyParams buildParams() {
    return CompanyParams(
      current: _company,
      name: name.text.trim(),
      phone: phone.text.trim(),
      address: address.text.trim(),
    );
  }
}
