import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/bottom_sheet/app_action_sheet.dart';
import 'package:app_laundry/core/ui/components/app_chip.dart';

import 'package:app_laundry/core/ui/components/avatar/app_icon_avatar.dart';

import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_entity_ext.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:app_laundry/features/order/domain/enums/order_status_ext.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/presentation/builders/order_action_builder.dart';

import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  final OrderEntity order;

  const OrderListItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final customer = order.customer;

    final orderStatus = order.orderStatus;
    final paymentStatus = order.paymentStatus;

    return GestureDetector(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: context.spacing.md),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.spacing.md,
            horizontal: context.spacing.lg,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// =========================
              /// HEADER
              /// =========================
              header(context, orderStatus),

              Divider(height: context.spacing.lg),

              /// =========================
              /// CONTENT
              /// =========================
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIconAvatar(icon: AppIcons.order),
                  context.spacing.md.w,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// CUSTOMER
                        Text(
                          customer?.name ?? 'Gojo',
                          style: context.titleSmall!.semiBold.onSurface(
                            context,
                          ),
                        ),

                        // context.spacing.xs.h,

                        /// CREATED AT + TOTAL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Masuk:  ${order.createOrder}',
                                  style: context.labelSmall!.secondary(context),
                                ),
                                Text(
                                  '0 Item',
                                  style: context.labelSmall!.secondary(context),
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  order.formattedTotal,
                                  style: context.bodyMedium!
                                      .primary(context)
                                      .semiBold,
                                ),
                                context.spacing.xs.h,
                                AppChip(
                                  label: paymentStatus.label,
                                  icon: paymentStatus.icon,
                                  color: paymentStatus.color(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        final actions = OrderActionBuilder.build(context, order);

        AppActionSheet.show(context, title: 'name', actions: actions);
      },
    );
  }

  Row header(BuildContext context, OrderStatus orderStatus) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          order.invoiceNumber,

          style: context.labelSmall!.semiBold.onSurface(context),
        ),

        AppChip(
          label: orderStatus.label,
          icon: orderStatus.icon,
          color: orderStatus.color(context),
        ),
      ],
    );
  }
}
