import 'package:app_laundry/features/order/domain/enums/order_status.dart';

extension OrderStatusFlowExt on OrderStatus {
  // =========================
  // NEXT STATUS
  // =========================

  OrderStatus? get next {
    switch (this) {
      case OrderStatus.received:
        return OrderStatus.inProgress;

      case OrderStatus.inProgress:
        return OrderStatus.ready;

      case OrderStatus.ready:
        return OrderStatus.pickedUp;

      case OrderStatus.pickedUp:
        return null;

      case OrderStatus.cancelled:
        return null;
    }
  }

  // =========================
  // CAN MOVE NEXT
  // =========================

  bool get canMoveNext {
    return next != null;
  }

  // =========================
  // IS FINISHED
  // =========================

  bool get isFinished {
    return this == OrderStatus.pickedUp || this == OrderStatus.cancelled;
  }
}
