// =============================================================================
// File        : customer_policy.dart
// Path        : lib/core/auth/policy/customer/customer_policy.dart
// Layer       : Core (Authorization)
// -----------------------------------------------------------------------------
// Fungsi:
// - Policy utama untuk CustomerEntity
// - Meng-handle permission berbasis resource (ownership, dll)
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/policy/base_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_delete_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_update_policy.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class CustomerPolicy implements BasePolicy<CustomerEntity> {
  final CustomerDeletePolicy deletePolicy;
  final CustomerUpdatePolicy updatePolicy;

  CustomerPolicy({required this.deletePolicy, required this.updatePolicy});

  /// =========================
  /// MAIN ENTRY
  /// =========================
  @override
  bool can(Permission permission, CustomerEntity customer) {
    switch (permission) {
      case Permission.canDeleteCustomer:
        return deletePolicy.canDelete(customer);

      case Permission.canUpdateCustomer:
        return updatePolicy.canUpdate(customer);

      /// 🔥 default → DENY (lebih aman)
      default:
        return false;
    }
  }

  /// =========================
  /// HELPER (DIRECT ACCESS)
  /// =========================
  bool canDelete(CustomerEntity customer) {
    return deletePolicy.canDelete(customer);
  }

  bool canUpdate(CustomerEntity customer) {
    return updatePolicy.canUpdate(customer);
  }
}
