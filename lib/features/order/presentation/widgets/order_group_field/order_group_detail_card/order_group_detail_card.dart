import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_detail_card/order_group_detail_body.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_detail_card/order_group_detail_footer.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_detail_card/order_group_detail_header.dart';
import 'package:flutter/material.dart';

class OrderGroupDetailCard extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupDetailCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: context.spacing.md),
      child: Column(
        children: [
          ExpansionTile(
            title: OrderGroupDetailHeader(group: group),
            children: [OrderGroupDetailBody(group: group)],
          ),
          OrderGroupDetailFooter(group: group),
        ],
      ),
    );
  }
}
