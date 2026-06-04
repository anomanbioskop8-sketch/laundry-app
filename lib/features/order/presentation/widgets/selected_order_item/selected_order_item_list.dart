import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/constants/strings/laundry_price_strings.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_laundry_item_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/selected_order_item/selected_order_item_tile_builder.dart';
import 'package:flutter/material.dart';

class SelectedOrderItemList extends StatelessWidget {
  const SelectedOrderItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<OrderLaundryItemCubit, OrderLaundryItemEntity>(
      empty: AppEmptyWidget(message: LaundryPriceStrings.empty),
      builder: (items) {
        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (_, index) {
            return SelectedOrderItemTileBuilder(item: items[index]);
          },
        );
      },
    );
  }
}
