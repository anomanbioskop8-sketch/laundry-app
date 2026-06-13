import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_display_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupCardChips extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupCardChips({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppChip(
          label: group.speedLabel,
          icon: group.speedIcon,
          color: group.speedColor(context),
        ),

        context.spacing.sm.w,

        AppChip(
          label: group.orderLabel,
          icon: group.orderIcon,
          color: group.speedColor(context),
        ),
      ],
    );
  }
}
