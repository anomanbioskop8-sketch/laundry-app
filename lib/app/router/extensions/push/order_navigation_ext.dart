// =============================================================================
// File        : order_navigation_ext.dart
// Path        : lib/app/router/extensions/order_navigation_ext.dart
// =============================================================================

import 'package:app_laundry/app/router/paths/order_paths.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension OrderNavigationExt on BuildContext {
  // =========================
  // ORDER PAGE
  // =========================

  void goOrder() {
    //goNamed(OrderPaths.order);
  }

  // =========================
  // ORDER FORM
  // =========================

  Future<T?> pushOrderForm<T>({OrderEntity? order}) {
    return pushNamed<T>(OrderPaths.orderForm, extra: order);
  }

  // =========================
  // ORDER DETAIL
  // =========================

  Future<T?> pushOrderDetail<T>({required OrderEntity order}) {
    return pushNamed<T>('OrderPaths.orderDetail', extra: order);
  }

  // =========================
  // ORDER GROUP FORM
  // =========================

  Future<T?> pushOrderGroupForm<T>({OrderEntity? order}) {
    return pushNamed<T>(OrderPaths.orderGroupForm, extra: order);
  }

  pushOrderLaundryItemForm() {
    return pushNamed(OrderPaths.orderLaundryItemForm);
  }
}
