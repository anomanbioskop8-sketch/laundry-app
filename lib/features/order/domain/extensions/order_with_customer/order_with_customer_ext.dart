import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_date_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_estimation_ext.dart';

extension OrderWithCustomerExt on OrderWithCustomerEntity {
  String get customerNameDisplay =>
      customer?.name ?? 'Pelanggan Tidak Diketahui';

  String get customerPhoneDisplay => customer?.phone ?? '-';

  String get createdAtDisplay {
    return order.createdAtDisplay;
  }

  String get estimatedFinishAtDisplay {
    return order.estimatedFinishAtDisplay;
  }

  String get estimationDisplay {
    return order.estimationDisplay;
  }

  String get earliestEstimationDisplay {
    return order.earliestEstimationDisplay;
  }
}
