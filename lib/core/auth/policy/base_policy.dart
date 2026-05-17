// =============================================================================
// File        : base_policy.dart
// Path        : lib/core/auth/policy/base_policy.dart
// Layer       : Core (Authorization / Policy System)
// -----------------------------------------------------------------------------
// Fungsi:
// - Interface dasar untuk semua resource-based policy
// - Digunakan untuk menentukan akses berbasis entity (Order, Customer, dll)
//
// Konsep:
// - Permission = apa yang boleh dilakukan (canDeleteOrder, canUpdateCustomer)
// - Resource = objek target (OrderEntity, CustomerEntity)
// - Policy = aturan bisnis tambahan (ownership, status, dll)
//
// Contoh:
// - User boleh delete order (role-based)
// - Tapi hanya jika order.status != DONE (policy-based)
//
// Semua policy spesifik (OrderPolicy, CustomerPolicy, dll)
// wajib mengimplementasikan class ini.
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';

abstract class BasePolicy<T> {
  /// Mengecek apakah user boleh melakukan aksi tertentu terhadap resource
  ///
  /// Parameter:
  /// - permission → aksi yang ingin dilakukan
  /// - resource → entity target (Order, Customer, dll)
  ///
  /// Return:
  /// - true  → diizinkan
  /// - false → ditolak
  bool can(Permission permission, T resource);
}
