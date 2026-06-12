import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';

extension OrderStatusMessageExt on OrderStatus {
  // =========================
  // SUCCESS MESSAGE
  // =========================

  String get successMessage {
    switch (this) {
      case OrderStatus.received:
        return OrderStrings.processSuccess;

      case OrderStatus.inProgress:
        return OrderStrings.completeSuccess;

      case OrderStatus.ready:
        return OrderStrings.pickupSuccess;

      case OrderStatus.pickedUp:
        return 'Order sudah diambil customer';

      case OrderStatus.cancelled:
        return OrderStrings.cancelSuccess;
    }
  }

  // =========================
  // CONFIRM MESSAGE
  // =========================

  String get confirmMessage {
    switch (this) {
      case OrderStatus.received:
        return OrderStrings.confirmProcess;

      case OrderStatus.inProgress:
        return OrderStrings.confirmComplete;

      case OrderStatus.ready:
        return OrderStrings.confirmPickup;

      case OrderStatus.pickedUp:
        return 'Order sudah diambil customer';

      case OrderStatus.cancelled:
        return OrderStrings.confirmCancel;
    }
  }
}
