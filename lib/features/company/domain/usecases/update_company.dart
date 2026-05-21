// =============================================================================
// File        : update_company.dart
// Path        : lib/features/company/domain/usecases/update_company.dart
// Layer       : Domain (UseCase)
// -----------------------------------------------------------------------------
// Fungsi:
// - Update data company
// =============================================================================

import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/company/domain/repositories/company_repository.dart';
import 'package:app_laundry/features/company/domain/usecases/company_params.dart';

import 'package:app_laundry/features/company/domain/extensions/company_params_ext.dart';

class UpdateCompany {
  final CompanyRepository _repository;

  UpdateCompany(this._repository);

  // =========================
  // CALL
  // =========================

  Future<Either<Failure, void>> call(CompanyParams params) {
    return _repository.update(params.toEntity);
  }
}
