// =============================================================================
// File        : order_delete_policy.dart
// Path        : lib/features/order/domain/policies/order_delete_policy.dart
// Layer       : Domain (Policy)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan apakah order boleh dihapus
// - Menggabungkan:
//   - role permission
//   - business rule status order
//
// Rules:
// - User harus memiliki Permission.canDeleteOrder
// - Order dengan status:
//   - pending
//   - canceled
//   boleh dihapus
// - Order selain itu tidak boleh dihapus
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

class OrderDeletePolicy {
  final SessionService session;

  const OrderDeletePolicy(this.session);

  // ===========================================================================
  // CHECK DELETE ACCESS
  // ===========================================================================

  bool canDelete(OrderEntity order) {
    final role = session.role;

    // =========================
    // ROLE PERMISSION
    // =========================
    final permissions = RolePermissions.get(role);

    final hasPermission = permissions.contains(Permission.canDeleteOrder);

    if (!hasPermission) {
      return false;
    }

    // =========================
    // BUSINESS RULE
    // =========================
    switch (order.orderStatus) {
      case OrderStatus.pending:
      case OrderStatus.canceled:
        return true;

      case OrderStatus.process:
      case OrderStatus.done:
      case OrderStatus.pickedUp:
        return false;
    }
  }
}
