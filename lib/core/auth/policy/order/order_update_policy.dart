// =============================================================================
// File        : order_update_policy.dart
// Path        : lib/features/order/domain/policies/order_update_policy.dart
// Layer       : Domain (Policy)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan apakah order boleh diupdate
// - Menggabungkan:
//   - role permission
//   - business rule status order
//
// Rules:
// - User harus memiliki Permission.canUpdateOrder
// - Order dengan status:
//   - pending
//   - process
//   boleh diupdate
// - Order selain itu tidak boleh diupdate
//
// Kenapa pakai Policy?
// - Business rule terpusat
// - UI tidak perlu tahu logic permission
// - Mudah di-test
// - Reusable di Cubit / UseCase / UI
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/permission/role_permissions.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';

class OrderUpdatePolicy {
  final SessionService session;

  const OrderUpdatePolicy(this.session);

  // ===========================================================================
  // CHECK UPDATE ACCESS
  // ===========================================================================

  bool canUpdate(OrderEntity order) {
    final role = session.role;

    // =========================
    // ROLE PERMISSION
    // =========================
    final permissions = RolePermissions.get(role);

    final hasPermission = permissions.contains(Permission.canUpdateOrder);

    if (!hasPermission) {
      return false;
    }

    // =========================
    // BUSINESS RULE
    // =========================
    switch (order.orderStatus) {
      case OrderStatus.received:
      case OrderStatus.inProgress:
        return true;

      case OrderStatus.ready:
      case OrderStatus.pickedUp:
      case OrderStatus.cancelled:
        return false;
    }
  }
}
