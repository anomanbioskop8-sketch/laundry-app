// =============================================================================
// File        : main_routes.dart
// Path        : lib/app/router/routes/main_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/main/presentation/pages/main_page.dart';
import 'package:go_router/go_router.dart';

class MainRoutes {
  MainRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: MainPaths.mainPath,
      name: MainPaths.main,
      builder: (_, _) => const MainPage(),
    ),
  ];
}
