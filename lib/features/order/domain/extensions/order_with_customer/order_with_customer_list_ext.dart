import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';

extension OrderWithCustomerListExt on List<OrderWithCustomerEntity> {
  List<OrderWithCustomerEntity> byStatus(OrderStatus? status) {
    if (status == null) return this;

    return where((e) => e.order.orderStatus == status).toList();
  }
}
