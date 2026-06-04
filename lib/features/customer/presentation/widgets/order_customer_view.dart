import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_list_item.dart';
import 'package:flutter/material.dart';

class OrderCustomerView extends StatelessWidget {
  const OrderCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<OrderCubit, OrderWithCustomerEntity>(
      empty: AppEmptyWidget(message: OrderStrings.empty, icon: AppIcons.order),
      builder: (items) {
        return ListView.separated(
          padding: EdgeInsets.all(context.spacing.lg),
          itemCount: items.length,

          /// 🔥 item
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: context.spacing.sm),
              child: OrderListItem(order: items[i]),
            );
          },

          /// 🔥 separator
          separatorBuilder: (_, i) => const Divider(),
        );
      },
    );
  }
}
