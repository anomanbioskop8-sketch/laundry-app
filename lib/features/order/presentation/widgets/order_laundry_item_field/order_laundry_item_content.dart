import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_laundry_item_field/order_laundry_item_list.dart';
import 'package:flutter/material.dart';

class OrderLaundryItemContent extends StatelessWidget {
  final List<OrderLaundryItemEntity> items;

  const OrderLaundryItemContent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return AppEmptyWidget(
        message: OrderStrings.emptyItem,
        icon: AppIcons.order,
      );
    }

    return OrderLaundryItemList(items: items);
  }
}
