// =============================================================================
// File        : string_laundry_item_category_ext.dart
// Path        : lib/features/laundry_item/domain/extensions/string_laundry_item_category_ext.dart
// =============================================================================

import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';

extension StringLaundryItemCategoryExt on String {
  LaundryItemCategory get toLaundryItemCategory {
    return LaundryItemCategoryX.fromString(this);
  }
}
