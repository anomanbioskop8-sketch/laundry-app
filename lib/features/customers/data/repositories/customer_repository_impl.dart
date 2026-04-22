import 'package:app_laundry/features/customers/data/mappers/customer_mapper.dart';

import '../../../../core/utils/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/exceptions.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/customer_repository.dart';
import '../datasources/customer_remote_datasource.dart';
import '../models/customer_model.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remote;

  CustomerRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAll() async {
    try {
      final data = await remote.getAll();
      return Right(CustomerMapper.toEntityList(data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
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
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> update(CustomerEntity customer) async {
    try {
      final model = CustomerModel(
        id: customer.id,
        name: customer.name,
        phone: customer.phone,
        address: customer.address,
        companyId: customer.companyId,
      );

      await remote.update(customer.id, model);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await remote.delete(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
