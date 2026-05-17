// =============================================================================
// File        : policy_resolver.dart
// Path        : lib/core/auth/permission/policy_resolver.dart
// Layer       : Core (Authorization)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan policy yang sesuai berdasarkan tipe resource (entity)
// - Digunakan dalam sistem permission berbasis konteks (resource-based auth)
// - Mendukung ownership check melalui BasePolicy
//
// Cara kerja:
// - Menerima object resource (misalnya OrderEntity / CustomerEntity)
// - Mencocokkan runtimeType dengan mapping policy
// - Mengembalikan policy yang sesuai
//
// Notes:
// - Jika resource null → return null
// - Jika tipe tidak terdaftar → return null (tidak ada policy)
// - Bergantung pada BasePolicy abstraction
// =============================================================================

import 'package:app_laundry/core/auth/policy/base_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_policy.dart';
import 'package:app_laundry/core/auth/policy/order/order_policy.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

class PolicyResolver {
  /// Mapping antara entity type dan policy yang menangani authorization-nya
  final Map<Type, BasePolicy> _policies;

  PolicyResolver({
    required CustomerPolicy customerPolicy,
    required OrderPolicy orderPolicy,
  }) : _policies = {CustomerEntity: customerPolicy, OrderEntity: orderPolicy};

  // ===========================================================================
  // RESOLVE POLICY
  // ===========================================================================

  /// Mengembalikan policy berdasarkan tipe resource
  ///
  /// Contoh:
  /// - CustomerEntity → CustomerPolicy
  /// - OrderEntity → OrderPolicy
  ///
  /// Return:
  /// - BasePolicy jika ditemukan
  /// - null jika resource null atau tidak ada policy yang cocok
  BasePolicy? resolve(Object? resource) {
    if (resource == null) return null;

    return _policies[resource.runtimeType];
  }
}
