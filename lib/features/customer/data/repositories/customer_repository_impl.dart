import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/error/mappers/failure_mapper.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/data/datasources/customer_remote_data_source.dart';
import 'package:app_laundry/features/customer/data/mappers/customer_mapper.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remote;

  CustomerRepositoryImpl(this.remote);

  /// =========================
  /// CREATE
  /// =========================
  @override
  Future<Either<Failure, void>> createCustomer({
    required String companyId,
    required CustomerEntity customer,
  }) async {
    try {
      final model = CustomerMapper.toModel(customer);

      await remote.create(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// GET BY ID
  /// =========================
  @override
  Future<Either<Failure, CustomerEntity?>> getCustomerById({
    required String companyId,
    required String customerId,
  }) async {
    try {
      final model = await remote.getById(companyId: companyId, id: customerId);

      if (model == null) return const Right(null);

      return Right(CustomerMapper.toEntity(model));
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  @override
  Stream<Either<Failure, List<CustomerEntity>>> streamCustomers(
    String companyId,
  ) async* {
    try {
      await for (final models in remote.streamAll(companyId)) {
        final entities = models.map(CustomerMapper.toEntity).toList();

        yield Right(entities);
      }
    } on AppException catch (e) {
      yield Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// UPDATE
  /// =========================
  @override
  Future<Either<Failure, void>> updateCustomer({
    required String companyId,
    required CustomerEntity customer,
  }) async {
    try {
      final model = CustomerMapper.toModel(customer);

      await remote.update(companyId: companyId, id: model.id, data: model);

      return const Right(null);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  /// =========================
  /// DELETE
  /// =========================
  @override
  Future<Either<Failure, void>> deleteCustomer({
    required String companyId,
    required String customerId,
  }) async {
    try {
      await remote.delete(companyId: companyId, id: customerId);
      return const Right(null);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }
}
