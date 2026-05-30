// =============================================================================
// File        : laundry_item_routes.dart
// Path        : lib/app/router/routes/laundry_item_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/paths/company_paths.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/presentation/wrappers/company_form_page_wrapper.dart';
import 'package:go_router/go_router.dart';

class CompanyRoutes {
  CompanyRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: CompanyPaths.companyFormPath,
      name: CompanyPaths.companyForm,
      builder: (context, state) {
        final company = state.extra as CompanyEntity;

        return CompanyFormPageWrapper(company: company);
      },
    ),
  ];
}
