// =============================================================================
// File        : customer_routes.dart
// Path        : lib/app/router/routes/customer_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_detail_page.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_form_page_wrapper.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_page_wrapper.dart';
import 'package:go_router/go_router.dart';

class CustomerRoutes {
  CustomerRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: CustomerPaths.customers,
      name: CustomerPaths.customersName,

      builder: (context, state) {
        final isPicker = state.extra as bool? ?? false;

        return CustomerPageWrapper(isPicker: isPicker);
      },
    ),

    GoRoute(
      path: CustomerPaths.customerForm,
      name: CustomerPaths.customerFormName,

      builder: (context, state) {
        final customer = state.extra as CustomerEntity?;

        return CustomerFormPageWrapper(customer: customer);
      },
    ),

    GoRoute(
      path: CustomerPaths.customerDetail,
      name: CustomerPaths.customerDetailName,

      builder: (context, state) {
        final customer = state.extra as CustomerEntity;

        return CustomerDetailPage(customer: customer);
      },
    ),
  ];
}
