import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_flags_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_summary_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';

extension OrderGroupPriceExt on OrderGroupEntity {
  int get subtotal {
    if (isKg) {
      return ((weight ?? 0) * unitPrice).round();
    }

    return items.subtotal;
  }

  String get formattedPrice => CurrencyFormatter.idr(unitPrice);

  String get formattedSubtotal => CurrencyFormatter.idr(subtotal);

  String get calculationText {
    if (isKg) {
      return '${weight ?? 0} Kg × ${CurrencyFormatter.idr(unitPrice)}';
    }

    return '$totalQuantity Item';
  }

  String get subtotalDescription {
    if (isKg) {
      return '$calculationText = $formattedSubtotal';
    }

    return '$totalQuantity Item = $formattedSubtotal';
  }
}
