import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_card/order_group_card_chips.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_card/order_group_card_footer.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_card/order_group_card_header.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_card/order_group_delete_button.dart';
import 'package:flutter/material.dart';

class OrderGroupCard extends StatelessWidget {
  final OrderGroupEntity group;
  final VoidCallback? onDelete;

  const OrderGroupCard({super.key, required this.group, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderGroupCardHeader(group: group),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderGroupCardChips(group: group),
                OrderGroupDeleteButton(onPressed: onDelete),
              ],
            ),

            context.spacing.sm.h,

            OrderGroupCardFooter(group: group),
          ],
        ),
      ),
    );
  }
}
