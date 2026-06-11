import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/bottom_sheets/app_action_sheet.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/core/ui/widgets/avatar/app_icon_avatar.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status_ext.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_entity_ext.dart';
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
        padding: EdgeInsets.all(context.spacing.md),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// =========================
            /// HEADER
            /// =========================
            _HeaderOrderItem(order: order.order),

            Divider(height: context.spacing.md),

            /// =========================
            /// CONTENT
            /// =========================
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIconAvatar(icon: AppIcons.order),
                context.spacing.sm.w,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// CUSTOMER
                      Text(
                        customerName,
                        style: context.text.titleMedium!.semiBold.onSurface(
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
                                'Masuk:  $createdAt',
                                style: context.text.bodyMedium!
                                    .onSurfaceVariant(context),
                              ),
                              Text(
                                'Deadline: ${order.order.deadlineDuration?.inDays ?? 0} Hari',
                                style: context.text.bodyMedium!.warning(
                                  context,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                formattedTotal,
                                style: context.text.bodyMedium!.semiBold
                                    .primary(context),
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
          style: context.text.labelMedium!.semiBold.onSurface(context),
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
