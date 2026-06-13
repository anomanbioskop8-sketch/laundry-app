import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_list_ext.dart';

extension OrderPriceExt on OrderEntity {
  int get subtotal => groups.grandTotal;

  String get formattedTotal => CurrencyFormatter.idr(total);
}
