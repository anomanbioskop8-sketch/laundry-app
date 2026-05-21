// =============================================================================
// File        : company_params_ext.dart
// Path        : lib/features/company/domain/extensions/company_params_ext.dart
// Layer       : Domain
// -----------------------------------------------------------------------------
// Fungsi:
// - Mapper CompanyParams -> CompanyEntity
// =============================================================================

import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

import 'package:app_laundry/features/company/domain/usecases/company_params.dart';

extension CompanyParamsExt on CompanyParams {
  CompanyEntity get toEntity {
    return current.copyWith(name: name, phone: phone, address: address);
  }
}
