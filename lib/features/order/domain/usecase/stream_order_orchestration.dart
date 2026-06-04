// =============================================================================
// File : stream_order_orchestration.dart
// =============================================================================

import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/get_customers_by_ids.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/stream_orders.dart';

class StreamOrderOrchestration {
  final StreamOrders _streamOrders;
  final GetCustomersByIds _getCustomersByIds;

  StreamOrderOrchestration({
    required StreamOrders streamOrders,
    required GetCustomersByIds getCustomersByIds,
  }) : _streamOrders = streamOrders,
       _getCustomersByIds = getCustomersByIds;

  Stream<Either<Failure, List<OrderWithCustomerEntity>>> call() {
    return _streamOrders().asyncMap((result) async {
      if (result.isLeft) {
        return Left(result.left!);
      }

      final orders = result.right;

      if (orders!.isEmpty) {
        return const Right([]);
      }

      final customerIds = orders
          .map((e) => e.customerId)
          .where((e) => e.isNotEmpty)
          .toSet()
          .toList();

      final customersResult = await _getCustomersByIds(customerIds);

      if (customersResult.isLeft) {
        return Left(customersResult.left!);
      }

      final customers = customersResult.right;

      final customerMap = <String, CustomerEntity>{
        for (final customer in customers!) customer.id: customer,
      };

      final data = orders.map((order) {
        return OrderWithCustomerEntity(
          order: order,
          customer: customerMap[order.customerId],
        );
      }).toList();

      return Right(data);
    });
  }
}
