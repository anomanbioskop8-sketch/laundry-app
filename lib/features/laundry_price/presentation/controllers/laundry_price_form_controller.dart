import 'package:app_laundry/core/form/controllers/form_controller.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/params/save_laundry_price_params.dart';
import 'package:flutter/material.dart';

class LaundryPriceFormController extends FormController {
  final price = TextEditingController();

  String? _id;
  String? _laundryItemId;
  LaundrySpeedType? _speedType;
  LaundryServiceType? _serviceType;

  @override
  List<TextEditingController> get controllers => [price];

  /// =========================
  /// SET DATA (EDIT)
  /// =========================
  void setData(LaundryPriceEntity item) {
    _id = item.id;
    _laundryItemId = item.laundryItemId;
    _speedType = item.speedType;
    _serviceType = item.serviceType;
    price.text = item.price.toString();
  }

  /// =========================
  /// MODE
  /// =========================
  bool get isEdit => _id != null;

  /// =========================
  /// BUILD PARAMS
  /// =========================

  SaveLaundryPriceParams buildParams() {
    return SaveLaundryPriceParams(
      id: _id,
      laundryItemId: _laundryItemId!,
      speedType: _speedType!,
      serviceType: _serviceType!,
      price: int.tryParse(price.text) ?? 0,
    );
  }
}
