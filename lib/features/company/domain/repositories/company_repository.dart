// =============================================================================
// File        : company_repository.dart
// Path        : lib/features/company/domain/repositories/company_repository.dart
// Layer       : Domain
// -----------------------------------------------------------------------------
// Fungsi:
// - Contract repository Company
// =============================================================================

import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

abstract class CompanyRepository {
  // =========================
  // GET
  // =========================

  Future<Either<Failure, CompanyEntity?>> getById(String companyId);

  // =========================
  // STREAM
  // =========================

  Stream<Either<Failure, CompanyEntity?>> streamById(String companyId);

  // =========================
  // CREATE
  // =========================

  Future<Either<Failure, void>> create(CompanyEntity company);

  // =========================
  // UPDATE
  // =========================

  Future<Either<Failure, void>> update(CompanyEntity company);

  // =========================
  // DELETE
  // =========================

  Future<Either<Failure, void>> delete(String companyId);
}
