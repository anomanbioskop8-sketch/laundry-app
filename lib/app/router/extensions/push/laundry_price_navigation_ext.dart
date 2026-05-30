import 'package:app_laundry/app/router/paths/laundry_price_paths.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension LaundryPriceNavigationExt on BuildContext {
  Future<T?> pushLaundryPriceForm<T>({LaundryPriceEntity? laundryPrice}) {
    return pushNamed<T>(
      LaundryPricePaths.laundryPriceForm,
      extra: laundryPrice,
    );
  }
}
