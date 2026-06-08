import 'package:app_laundry/core/base/stream/base_stream_builder.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_list_item.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<OrderCubit, OrderWithCustomerEntity>(
      empty: AppEmptyWidget(message: OrderStrings.empty, icon: AppIcons.order),
      builder: (items) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.md),
          itemCount: items.length,
          itemBuilder: (_, i) => OrderListItem(order: items[i]),
          separatorBuilder: (_, i) => const Divider(),
        );
      },
    );
  }
}
