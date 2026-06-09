import 'package:app_laundry/core/base/stream/base_stream_builder.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_list_ext.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_laundry_item_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/selected_order_item/selected_order_item_tile_builder.dart';
import 'package:flutter/material.dart';

class SelectedOrderItemView extends StatelessWidget {
  final LaundryItemCategory? category;
  const SelectedOrderItemView({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<OrderLaundryItemCubit, OrderLaundryItemEntity>(
      empty: AppEmptyWidget(message: LaundryItemStrings.empty),
      builder: (items) {
        final visibleItems = items.byCategory(category);

        if (visibleItems.isEmpty) {
          return AppEmptyWidget(
            message: LaundryItemStrings.empty,
            icon: AppIcons.items,
          );
        }
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.md),
          itemCount: visibleItems.length,
          separatorBuilder: (_, i) => const Divider(),
          itemBuilder: (_, index) {
            return SelectedOrderItemTileBuilder(item: visibleItems[index]);
          },
        );
      },
    );
  }
}
