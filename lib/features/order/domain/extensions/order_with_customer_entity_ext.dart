import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_entity_ext.dart';

extension OrderWithCustomerEntityExt on OrderWithCustomerEntity {
  String get customerName => customer?.name ?? 'Pelanggan Tidak Diketahui';

  String get customerPhone => customer?.phone ?? '-';

  String get invoiceNumber => order.invoiceNumber;

  String get formattedTotal => order.formattedTotal;

  String get createdAt => order.formattedCreatedAt;

  // bool get isPaid => order.paymentStatus.isPaid;

  // bool get isCompleted => order.orderStatus.isCompleted;

  int get totalGroups => order.groups.length;

  int get totalItems =>
      order.groups.fold(0, (sum, group) => sum + group.items.length);
}
