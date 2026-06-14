import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';

extension OrderListExt on List<OrderEntity> {
  List<OrderEntity> byStatus(OrderStatus? status) {
    if (status == null) return this;

    return where((e) => e.orderStatus == status).toList();
  }
}
