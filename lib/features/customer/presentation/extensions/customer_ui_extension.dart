// =============================================================================
// File        : customer_uix.dart
// Path        : lib/features/customer/presentation/extensions/customer_uix.dart
// Layer       : Presentation (UI Extension)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan helper UI untuk CustomerEntity
// - Menghasilkan display name customer
// - Membuat inisial nama customer untuk avatar
// - Menentukan warna avatar berdasarkan hash nama customer
// - Mempermudah pemanggilan data UI langsung dari entity
// =============================================================================

import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:flutter/material.dart';

extension CustomerUIX on CustomerEntity {
  /// Nama customer yang ditampilkan di UI
  String get displayName => name;

  /// Membuat inisial nama customer
  ///
  /// Contoh:
  /// - "Wira" => "W"
  /// - "Wira Laundry" => "WL"
  String get initials {
    if (displayName.isEmpty) return '?';

    final parts = displayName.trim().split(' ');

    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }

    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  /// Menghasilkan warna avatar berdasarkan hash nama customer
  ///
  /// Warna akan konsisten untuk nama yang sama
  Color get avatarColor {
    final colors = AppSemanticColors.avatarColors;

    return colors[displayName.hashCode % colors.length];
  }
}
