import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/constants/order_strings.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_list_item.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<OrderCubit, OrderEntity>(
      empty: AppEmptyWidget(message: OrderStrings.empty),
      builder: (items) {
        return ListView.separated(
          itemCount: items.length,

          /// 🔥 item
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.all(context.spacing.sm),
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
