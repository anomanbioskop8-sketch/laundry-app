import 'package:app_laundry/features/order/domain/enums/order_status.dart';

extension OrderStatusFlagExt on OrderStatus {
  bool get isReceived => this == OrderStatus.received;
  bool get isInProgress => this == OrderStatus.inProgress;
  bool get isReady => this == OrderStatus.ready;
  bool get isPickedUp => this == OrderStatus.pickedUp;
  bool get isCancelled => this == OrderStatus.cancelled;
  bool get isActive => !isPickedUp && !isCancelled;
}
