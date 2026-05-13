import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

abstract class OrderRepository {
  Stream<Either<Failure, List<OrderEntity>>> streamAll(String companyId);

  Future<Either<Failure, OrderEntity?>> getById({
    required String companyId,
    required String id,
  });

  Future<Either<Failure, OrderEntity>> create({
    required String companyId,
    required OrderEntity order,
  });

  Future<Either<Failure, void>> update({
    required String companyId,
    required OrderEntity order,
  });

  Future<Either<Failure, void>> deleteById({
    required String companyId,
    required String id,
  });
}
