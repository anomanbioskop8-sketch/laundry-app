// =============================================================================
// File        : policy_resolver.dart
// Path        : lib/core/auth/permission/policy_resolver.dart
// Layer       : Core (Authorization)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan policy berdasarkan tipe resource
// - Digunakan untuk permission berbasis entity (ownership, dll)
// =============================================================================

import 'package:app_laundry/core/auth/policy/base_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_policy.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class PolicyResolver {
  final Map<Type, BasePolicy> _policies;

  PolicyResolver({
    required CustomerPolicy customerPolicy,
    // required OrderPolicy orderPolicy,
  }) : _policies = {
         CustomerEntity: customerPolicy,
         // OrderEntity: orderPolicy,
       };

  /// =========================
  /// RESOLVE POLICY BY RESOURCE
  /// =========================
  BasePolicy? resolve(Object? resource) {
    if (resource == null) return null;

    return _policies[resource.runtimeType];
  }
}
