// =============================================================================
// File        : subscription_routes.dart
// Path        : lib/app/router/routes/subscription_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/paths/subscription_paths.dart';

import 'package:app_laundry/features/subscription/presentation/pages/subscription_page.dart';

import 'package:go_router/go_router.dart';

class SubscriptionRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: SubscriptionPaths.subscription,
      name: SubscriptionPaths.subscriptionName,

      builder: (_, _) {
        return const SubscriptionPage();
      },
    ),
  ];
}
