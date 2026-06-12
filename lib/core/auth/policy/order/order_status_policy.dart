// =============================================================================
// File        : order_status_policy.dart
// Path        : lib/features/order/domain/policies/order_status_policy.dart
// Layer       : Domain (Policy)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan apakah status order boleh diubah
// - Menggabungkan:
//   - role permission
//   - business rule transisi status
//
// Rules:
// - User harus memiliki Permission.canChangeStatus
// - Status order hanya boleh berubah secara valid
//
// Valid Transition:
// - pending   -> process
// - process   -> done
// - done      -> pickedUp
//
// Cancel Rules:
// - pending   -> canceled
// - process   -> canceled
//
// Tidak Boleh:
// - pickedUp  -> status lain
// - canceled  -> status lain
// - lompat status
//
// Kenapa pakai Policy?
// - Business rule terpusat
// - UI tidak perlu tahu logic workflow
// - Mudah di-test
// - Reusable di Cubit / UseCase / UI
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/permission/role_permissions.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';

class OrderStatusPolicy {
  final SessionService session;

  const OrderStatusPolicy(this.session);

  // ===========================================================================
  // CHECK STATUS TRANSITION
  // ===========================================================================

  bool canChange({required OrderStatus from, required OrderStatus to}) {
    final role = session.role;

    // =========================
    // ROLE PERMISSION
    // =========================
    final permissions = RolePermissions.get(role);

    final hasPermission = permissions.contains(Permission.canChangeStatus);

    if (!hasPermission) {
      return false;
    }

    // =========================
    // SAME STATUS
    // =========================
    if (from == to) {
      return false;
    }

    // =========================
    // STATUS FLOW
    // =========================
    switch (from) {
      case OrderStatus.received:
        return to == OrderStatus.inProgress || to == OrderStatus.cancelled;

      case OrderStatus.inProgress:
        return to == OrderStatus.ready || to == OrderStatus.cancelled;

      case OrderStatus.ready:
        return to == OrderStatus.pickedUp;

      case OrderStatus.pickedUp:
        return false;

      case OrderStatus.cancelled:
        return false;
    }
  }
}
