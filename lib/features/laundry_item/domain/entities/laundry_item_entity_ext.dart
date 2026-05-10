// features/laundry_price/domain/entities/laundry_price_entity_ext.dart

import 'package:app_laundry/core/constants/laundry_price_strings.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:flutter/material.dart';

extension LaundryItemEntityExt on LaundryItemEntity {
  /// =========================
  /// ORDER
  /// =========================

  String get title => '${LaundryPriceStrings.title} $name';

  String get catgoryLabel => category.label;

  IconData get categoryIcon => category.icon;
}
