import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

extension OrderLaundryItemListExt on List<OrderLaundryItemEntity> {
  int get subtotal => fold(0, (sum, item) => sum + item.subtotal);

  int get totalQuantity => fold(0, (sum, item) => sum + item.qty);

  String get formattedSubtotal => CurrencyFormatter.idr(subtotal);
}

extension OrderLaundryItemEntityExt on OrderLaundryItemEntity {
  /// Calculation
  int get subtotal => qty * price;

  /// Formatting
  String get formattedPrice => CurrencyFormatter.idr(price);

  String get formattedSubtotal => CurrencyFormatter.idr(subtotal);

  String get quantityAndPriceDisplay => '$qty x $formattedPrice';
}
