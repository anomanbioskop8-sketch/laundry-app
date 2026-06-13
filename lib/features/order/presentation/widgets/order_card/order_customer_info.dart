import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/avatar/app_icon_avatar.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_with_customer/order_with_customer_ext.dart';
import 'package:flutter/material.dart';

class OrderCustomerInfo extends StatelessWidget {
  final OrderWithCustomerEntity order;

  const OrderCustomerInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          AppIconAvatar(icon: AppIcons.order),

          context.spacing.sm.w,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.customerNameDisplay,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.titleMedium!.semiBold.onSurface(context),
                ),

                context.spacing.xs.h,

                Text(
                  order.createdAtDisplay,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.bodyMedium!.onSurfaceVariant(context),
                ),

                Text(
                  order.estimationDisplay,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.bodyMedium!.warning(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
