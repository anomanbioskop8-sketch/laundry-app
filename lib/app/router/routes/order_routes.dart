// =============================================================================
// File        : order_routes.dart
// Path        : lib/app/router/routes/order_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/presentation/pages/selected_order_item_page.dart';
import 'package:app_laundry/features/order/presentation/wrappers/order_form_page_wrapper.dart';
import 'package:app_laundry/features/order/presentation/pages/order_group_form_page.dart';
import 'package:app_laundry/features/order/presentation/wrappers/order_laundry_item_page_wrapper.dart';
import 'package:go_router/go_router.dart';

class OrderRoutes {
  OrderRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: OrderPaths.orderFormPath,
      name: OrderPaths.orderForm,
      builder: (context, state) {
        final order = state.extra as OrderEntity?;

        return OrderFormPageWrapper(item: order);
      },
    ),

    GoRoute(
      path: OrderPaths.orderGroupFormPath,
      name: OrderPaths.orderGroupForm,
      builder: (_, _) {
        return const OrderGroupFormPage();
      },
    ),

    GoRoute(
      path: OrderPaths.orderLaundryItemFormPath,
      name: OrderPaths.orderLaundryItemForm,
      builder: (_, _) {
        return const OrderLaundryItemPageWrapper();
      },
    ),
  ];
}
