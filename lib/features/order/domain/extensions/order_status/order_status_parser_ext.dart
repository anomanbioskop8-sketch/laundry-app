import 'package:app_laundry/features/order/domain/enums/order_status.dart';

extension OrderStatusParserExt on String {
  OrderStatus get toOrderStatus {
    switch (this) {
      case 'received':
        return OrderStatus.received;
      case 'in_progress':
        return OrderStatus.inProgress;
      case 'ready':
        return OrderStatus.ready;
      case 'picked_up':
        return OrderStatus.pickedUp;
      case 'canceled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.received;
    }
  }
}
