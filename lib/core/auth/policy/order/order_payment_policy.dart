// =============================================================================
// File        : order_payment_policy.dart
// Path        : lib/features/order/domain/policies/order_payment_policy.dart
// Layer       : Domain (Policy)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan apakah order boleh dibayar
// - Menggabungkan:
//   - role permission
//   - business rule payment
//   - business rule status order
//
// Rules:
// - User harus memiliki Permission.canPayOrder
// - Order tidak boleh:
//   - canceled
// - Payment status:
//   - unpaid
//   - partial
//   boleh dibayar
// - Payment status paid tidak boleh dibayar lagi
//
// Kenapa pakai Policy?
// - Business rule terpusat
// - UI tidak perlu tahu logic payment
// - Mudah di-test
// - Reusable di Cubit / UseCase / UI
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/permission/role_permissions.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status.dart';

class OrderPaymentPolicy {
  final SessionService session;

  const OrderPaymentPolicy(this.session);

  // ===========================================================================
  // CHECK PAYMENT ACCESS
  // ===========================================================================

  bool canPay(OrderEntity order) {
    final role = session.role;

    // =========================
    // ROLE PERMISSION
    // =========================
    final permissions = RolePermissions.get(role);

    final hasPermission = permissions.contains(Permission.canPayOrder);

    if (!hasPermission) {
      return false;
    }

    // =========================
    // ORDER STATUS
    // =========================
    if (order.orderStatus == OrderStatus.cancelled) {
      return false;
    }

    // =========================
    // PAYMENT STATUS
    // =========================
    switch (order.paymentStatus) {
      case PaymentStatus.unpaid:
        return true;

      case PaymentStatus.paid:
        return false;
    }
  }
}
