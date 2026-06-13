// =============================================================================
// File        : order_routes.dart
// Path        : lib/app/router/routes/order_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/wrappers/order_confirmation_page_wrapper.dart';
import 'package:app_laundry/features/order/presentation/wrappers/order_form_page_wrapper.dart';
import 'package:app_laundry/features/order/presentation/wrappers/order_group_form_page_wrapper.dart';
import 'package:app_laundry/features/order/presentation/wrappers/order_item_selection_page_wrapper.dart';
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
        return const OrderGroupFormPageWrapper();
      },
    ),

    GoRoute(
      path: OrderPaths.orderLaundryItemFormPath,
      name: OrderPaths.orderLaundryItemForm,
      builder: (context, state) {
        final params = state.extra as StreamOrderLaundryItemsParams;

        return OrderItemSelectionPageWrapper(params: params);
      },
    ),

    GoRoute(
      path: OrderPaths.orderConfirmationPath,
      name: OrderPaths.orderConfirmation,
      builder: (context, state) {
        final order = state.extra as CreateOrderParams;

        return OrderConfirmationPageWrapper(order: order);
      },
    ),
  ];
}
