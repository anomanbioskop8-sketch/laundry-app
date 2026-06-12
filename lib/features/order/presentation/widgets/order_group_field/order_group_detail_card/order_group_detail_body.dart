import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_flags_ext.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_detail_card/order_group_detail_item_tile.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_detail_card/order_group_detail_weight_tile.dart';
import 'package:flutter/material.dart';

class OrderGroupDetailBody extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupDetailBody({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    if (group.isKg) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spacing.md),
        child: OrderGroupDetailWeightTile(group: group),
      );
    }

    return Column(
      children: group.items
          .map((item) => OrderGroupDetailItemTile(item: item))
          .toList(),
    );
  }
}
