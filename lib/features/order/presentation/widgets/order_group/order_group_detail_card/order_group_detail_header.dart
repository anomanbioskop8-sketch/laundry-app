import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/avatar/app_icon_avatar.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_display_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_estimation_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupDetailHeader extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupDetailHeader({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIconAvatar(icon: group.serviceIcon),
        context.spacing.sm.w,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.serviceLabel,
                  style: context.text.titleMedium!.semiBold,
                ),
                Text(
                  group.estimationDurationDisplay,
                  style: context.text.bodyMedium!.onSurfaceVariant(context),
                ),
              ],
            ),

            context.spacing.sm.h,

            Padding(
              padding: EdgeInsets.only(top: context.spacing.xs),
              child: Wrap(
                spacing: context.spacing.sm,
                runSpacing: context.spacing.xs,
                children: [
                  AppChip(
                    label: group.speedLabel,
                    icon: group.speedIcon,
                    color: group.speedColor(context),
                  ),

                  AppChip(
                    label: group.orderLabel,
                    icon: group.orderIcon,
                    color: group.speedColor(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
