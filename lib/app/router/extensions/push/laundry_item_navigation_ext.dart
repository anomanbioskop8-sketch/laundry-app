import 'package:app_laundry/app/router/paths/laundry_item_paths.dart';
import 'package:app_laundry/app/router/paths/laundry_price_paths.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension LaundryItemNavigationExt on BuildContext {
  Future<T?> pushLaundryItemForm<T>({LaundryItemEntity? laundryItem}) {
    return pushNamed<T>(LaundryItemPaths.laundryItemForm, extra: laundryItem);
  }

  Future<T?> pushLaundryPrice<T>({LaundryItemEntity? laundryItem}) {
    return pushNamed<T>(LaundryPricePaths.laundryPrice, extra: laundryItem);
  }
}
