import 'package:flutter/material.dart';

enum LaundryItemCategory {
  clothes, // baju, celana
  heavy, // selimut, bed cover
  special, // sepatu, tas
  others,
}

extension LaundryItemCategoryX on LaundryItemCategory {
  /// =========================
  /// 🔥 VALUE (for Firestore)
  /// =========================
  String get value {
    switch (this) {
      case LaundryItemCategory.clothes:
        return 'clothes';
      case LaundryItemCategory.heavy:
        return 'heavy';
      case LaundryItemCategory.special:
        return 'special';
      case LaundryItemCategory.others:
        return 'others';
    }
  }

  /// =========================
  /// 🔥 LABEL (for UI)
  /// =========================
  String get label {
    switch (this) {
      case LaundryItemCategory.clothes:
        return 'Pakaian';
      case LaundryItemCategory.heavy:
        return 'Item Berat';
      case LaundryItemCategory.special:
        return 'Spesial';
      case LaundryItemCategory.others:
        return 'Lainnya';
    }
  }

  /// =========================
  /// 🔥 ICON (for UI)
  /// =========================
  IconData get icon {
    switch (this) {
      case LaundryItemCategory.clothes:
        return Icons.checkroom;
      case LaundryItemCategory.heavy:
        return Icons.bed;
      case LaundryItemCategory.special:
        return Icons.star;
      case LaundryItemCategory.others:
        return Icons.category;
    }
  }

  /// =========================
  /// 🔥 FROM STRING (SAFE PARSE)
  /// =========================
  static LaundryItemCategory fromString(String? value) {
    switch (value) {
      case 'clothes':
        return LaundryItemCategory.clothes;
      case 'heavy':
        return LaundryItemCategory.heavy;
      case 'special':
        return LaundryItemCategory.special;
      default:
        return LaundryItemCategory.others;
    }
  }
}
