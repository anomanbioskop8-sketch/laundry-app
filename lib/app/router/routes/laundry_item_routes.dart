// =============================================================================
// File        : laundry_item_routes.dart
// Path        : lib/app/router/routes/laundry_item_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/presentation/wrappers/laundry_item_form_page_wrapper.dart';
import 'package:go_router/go_router.dart';

class LaundryItemRoutes {
  LaundryItemRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: LaundryItemPaths.laundryItemFormPath,
      name: LaundryItemPaths.laundryItemForm,
      builder: (context, state) {
        final item = state.extra as LaundryItemEntity?;

        return LaundryItemFormPageWrapper(item: item);
      },
    ),
  ];
}
