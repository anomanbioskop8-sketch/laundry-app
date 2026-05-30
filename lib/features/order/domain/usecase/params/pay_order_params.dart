import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

class PayOrderParams {
  final OrderEntity order;
  final int amount;

  const PayOrderParams({required this.order, required this.amount});
}
