// =============================================================================
// File        : customer_routes.dart
// Path        : lib/app/router/routes/customer_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/wrappers/customer_detail_page_wrapper.dart';
import 'package:app_laundry/features/customer/presentation/wrappers/customer_form_page_wrapper.dart';
import 'package:app_laundry/features/customer/presentation/wrappers/customer_page_wrapper.dart';
import 'package:go_router/go_router.dart';

class CustomerRoutes {
  CustomerRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: CustomerPaths.customerPath,
      name: CustomerPaths.customer,
      builder: (context, state) {
        final isPicker = state.extra as bool? ?? false;

        return CustomerPageWrapper(isPicker: isPicker);
      },
    ),

    GoRoute(
      path: CustomerPaths.customerFormPath,
      name: CustomerPaths.customerForm,
      builder: (context, state) {
        final customer = state.extra as CustomerEntity?;

        return CustomerFormPageWrapper(customer: customer);
      },
    ),

    GoRoute(
      path: CustomerPaths.customerDetailPath,
      name: CustomerPaths.customerDetail,
      builder: (context, state) {
        final customer = state.extra as CustomerEntity;

        return CustomerDetailPageWrapper(customer: customer);
      },
    ),
  ];
}
