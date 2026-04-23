import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/exception_extension.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customers/data/datasources/customer_remote_datasource.dart';
import 'package:app_laundry/features/customers/data/mappers/customer_mapper.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remote;

  CustomerRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAll() async {
    try {
      final data = await remote.getAll();
      return Right(CustomerMapper.toEntityList(data));
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Stream<List<CustomerEntity>> streamByCompany(String companyId) {
    return remote.streamByCompany(companyId).map(CustomerMapper.toEntityList);
  }

  @override
  Future<Either<Failure, void>> create(CustomerEntity customer) async {
    try {
      final model = CustomerMapper.toModel(customer);

      await remote.create(customer.id, model);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> update(CustomerEntity customer) async {
    try {
      final model = CustomerMapper.toModel(customer);

      await remote.update(customer.id, model);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await remote.delete(id);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }
}
