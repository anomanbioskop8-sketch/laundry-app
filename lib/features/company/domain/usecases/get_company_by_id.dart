// =============================================================================
// File        : get_company_by_id.dart
// Path        : lib/features/company/domain/usecases/get_company_by_id.dart
// Layer       : Domain (UseCase)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengambil company berdasarkan id
// =============================================================================

import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/domain/repositories/company_repository.dart';

class GetCompanyById {
  final CompanyRepository _repository;

  GetCompanyById(this._repository);

  // =========================
  // CALL
  // =========================

  Future<Either<Failure, CompanyEntity?>> call(String companyId) {
    return _repository.getById(companyId);
  }
}
