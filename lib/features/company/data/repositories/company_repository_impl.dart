// =============================================================================
// File        : company_repository_impl.dart
// Path        : lib/features/company/data/repositories/company_repository_impl.dart
// Layer       : Data
// -----------------------------------------------------------------------------
// Fungsi:
// - Implementasi repository Company
// - Bridge datasource <-> entity
// =============================================================================

import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/extensions/app_exception_ext.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/company/data/datasources/company_remote_data_source.dart';
import 'package:app_laundry/features/company/data/mappers/company_mapper_ext.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemoteDataSource _remote;

  CompanyRepositoryImpl(this._remote);

  // =========================
  // STREAM
  // =========================

  @override
  Stream<Either<Failure, CompanyEntity?>> streamById(String companyId) async* {
    try {
      yield* _remote
          .streamById(companyId)
          .map((event) => Right(event?.toEntity));
    } on AppException catch (e) {
      yield Left(e.toFailure);
    }
  }

  // =========================
  // GET
  // =========================

  @override
  Future<Either<Failure, CompanyEntity?>> getById(String companyId) async {
    try {
      final model = await _remote.getById(companyId);

      if (model == null) {
        return const Right(null);
      }

      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  // =========================
  // CREATE
  // =========================

  @override
  Future<Either<Failure, void>> create(CompanyEntity company) async {
    try {
      await _remote.create(company.toModel);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  // =========================
  // UPDATE
  // =========================

  @override
  Future<Either<Failure, void>> update(CompanyEntity company) async {
    try {
      await _remote.update(company.toModel);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  // =========================
  // DELETE
  // =========================

  @override
  Future<Either<Failure, void>> delete(String companyId) async {
    try {
      await _remote.delete(companyId);

      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }
}
