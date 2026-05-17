// =============================================================================
// File        : laundry_price_routes.dart
// Path        : lib/app/router/routes/laundry_price_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/extensions/laundry_item_entity_ext.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/presentation/pages/laundry_price_form_page_wrapper.dart';
import 'package:app_laundry/features/laundry_price/presentation/pages/laundry_price_page_wrapper.dart';
import 'package:go_router/go_router.dart';

class LaundryPriceRoutes {
  LaundryPriceRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: LaundryPricePaths.laundryPrice,
      name: LaundryPricePaths.laundryPriceName,

      builder: (context, state) {
        final item = state.extra as LaundryItemEntity;

        return LaundryPricePageWrapper(itemId: item.id, itemName: item.title);
      },
    ),

    GoRoute(
      path: LaundryPricePaths.laundryPriceForm,
      name: LaundryPricePaths.laundryPriceFormName,

      builder: (context, state) {
        final price = state.extra as LaundryPriceEntity?;

        return LaundryPriceFormPageWrapper(price: price);
      },
    ),
  ];
}
