import 'package:app_laundry/core/base/form/fields/form_option.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:flutter/material.dart';

extension LaundryItemCategoryExt on LaundryItemCategory {
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
        return Icons.checkroom_outlined;
      case LaundryItemCategory.heavy:
        return Icons.bed_outlined;
      case LaundryItemCategory.special:
        return Icons.star_outline;
      case LaundryItemCategory.others:
        return Icons.category_outlined;
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

  // =========================
  // FORM OPTION
  // =========================

  FormOption get option {
    return FormOption(value: value, label: label, icon: icon);
  }

  // =========================
  // FORM OPTIONS
  // =========================

  static List<FormOption> get options {
    return LaundryItemCategory.values.map((e) => e.option).toList();
  }
}
