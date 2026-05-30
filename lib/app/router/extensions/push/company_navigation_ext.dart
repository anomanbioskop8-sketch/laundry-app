// =============================================================================
// File        : company_navigation_ext.dart
// Path        : lib/app/router/extensions/company_navigation_ext.dart
// =============================================================================

import 'package:app_laundry/app/router/paths/company_paths.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension CompanyNavigationExt on BuildContext {
  // =========================
  // COMPANY FORM
  // =========================

  Future<T?> pushCompanyForm<T>({CompanyEntity? company}) {
    return pushNamed<T>(CompanyPaths.companyForm, extra: company);
  }

  void goCompanyForm({CompanyEntity? company}) {
    goNamed(CompanyPaths.companyForm, extra: company);
  }

  // =========================
  // BACK
  // =========================

  void popPage<T extends Object?>([T? result]) {
    pop(result);
  }
}
