import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/bottom_sheet/app_action_sheet.dart';
import 'package:app_laundry/core/ui/components/app_chip.dart';
import 'package:app_laundry/core/ui/components/avatar/app_icon_avatar.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status_ext.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_with_customer_entity_ext.dart';
import 'package:app_laundry/features/order/presentation/builders/order_action_builder.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  final OrderWithCustomerEntity order;

  const OrderListItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final customerName = order.customerName;
    return GestureDetector(
      child: _OrderCard(order: order),
      onTap: () {
        final actions = OrderActionBuilder.build(context, order.order);
        AppActionSheet.show(context, title: customerName, actions: actions);
      },
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final OrderWithCustomerEntity order;

  @override
  Widget build(BuildContext context) {
    final customerName = order.customerName;
    final createdAt = order.createdAt;
    final formattedTotal = order.formattedTotal;
    final paymentStatus = order.order.paymentStatus;
    return Card(
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
            _HeaderOrderItem(order: order.order),

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
                        customerName,
                        style: context.titleSmall!.semiBold.onSurface(context),
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
                                'Masuk:  $createdAt',
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
                                formattedTotal,
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
    );
  }
}

class _HeaderOrderItem extends StatelessWidget {
  final OrderEntity order;

  const _HeaderOrderItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          order.invoiceNumber,
          style: context.labelSmall!.semiBold.onSurface(context),
        ),
        AppChip(
          label: order.orderStatus.label,
          icon: order.orderStatus.icon,
          color: order.orderStatus.color(context),
        ),
      ],
    );
  }
}
