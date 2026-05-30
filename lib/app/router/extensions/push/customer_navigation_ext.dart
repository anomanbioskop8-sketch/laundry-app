// =============================================================================
// File        : customer_navigation_ext.dart
// Path        : lib/app/router/extensions/customer_navigation_ext.dart
// =============================================================================

import 'package:app_laundry/app/router/paths/customer_paths.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension CustomerNavigationExt on BuildContext {
  // =========================
  // CUSTOMER PAGE
  // =========================

  Future<T?> goCustomer<T>({bool isPicker = false}) {
    return pushNamed<T>(CustomerPaths.customer, extra: true);
  }

  // =========================
  // CUSTOMER FORM
  // =========================

  Future<T?> pushCustomerForm<T>({CustomerEntity? customer}) {
    return pushNamed<T>(CustomerPaths.customerForm, extra: customer);
  }

  // =========================
  // CUSTOMER DETAIL
  // =========================

  Future<T?> pushCustomerDetail<T>({required CustomerEntity customer}) {
    return pushNamed<T>(CustomerPaths.customerDetail, extra: customer);
  }
}
