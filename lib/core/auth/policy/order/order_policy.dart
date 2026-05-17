// =============================================================================
// File        : order_policy.dart
// Path        : lib/core/auth/policy/order/order_policy.dart
// Layer       : Core (Authorization)
// -----------------------------------------------------------------------------
// Fungsi:
// - Policy utama untuk OrderEntity
// - Meng-handle semua authorization terkait Order
// - Delegasi ke sub-policy (delete, update, payment, status)
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/policy/base_policy.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

import 'order_delete_policy.dart';
import 'order_update_policy.dart';
import 'order_payment_policy.dart';
import 'order_status_policy.dart';

class OrderPolicy implements BasePolicy<OrderEntity> {
  final OrderDeletePolicy deletePolicy;
  final OrderUpdatePolicy updatePolicy;
  final OrderPaymentPolicy paymentPolicy;
  final OrderStatusPolicy statusPolicy;

  OrderPolicy({
    required this.deletePolicy,
    required this.updatePolicy,
    required this.paymentPolicy,
    required this.statusPolicy,
  });

  // ===========================================================================
  // MAIN ENTRY
  // ===========================================================================

  @override
  bool can(Permission permission, OrderEntity order) {
    switch (permission) {
      case Permission.canDeleteOrder:
        return deletePolicy.canDelete(order);

      case Permission.canUpdateOrder:
        return updatePolicy.canUpdate(order);

      case Permission.canPayOrder:
        return paymentPolicy.canPay(order);

      case Permission.canChangeStatus:
        // default check (bisa diperluas jika butuh from/to)
        return true;

      default:
        return false;
    }
  }

  // ===========================================================================
  // HELPER METHODS (DIRECT ACCESS)
  // ===========================================================================

  bool canDelete(OrderEntity order) {
    return deletePolicy.canDelete(order);
  }

  bool canUpdate(OrderEntity order) {
    return updatePolicy.canUpdate(order);
  }

  bool canPay(OrderEntity order) {
    return paymentPolicy.canPay(order);
  }

  bool canChangeStatus(OrderEntity order) {
    // fallback sederhana (kalau butuh from/to pakai OrderStatusPolicy langsung)
    return statusPolicy.canChange(
      from: order.orderStatus,
      to: order.orderStatus,
    );
  }
}
