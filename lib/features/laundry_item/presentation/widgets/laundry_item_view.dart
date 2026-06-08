import 'package:app_laundry/core/base/stream/base_stream_builder.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/widgets/laundry_item_list_item.dart';
import 'package:flutter/material.dart';

class LaundryItemView extends StatelessWidget {
  final LaundryItemCategory? category;

  const LaundryItemView({super.key, this.category});
  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<LaundryItemCubit, LaundryItemEntity>(
      empty: AppEmptyWidget(
        message: LaundryItemStrings.empty,
        icon: AppIcons.items,
      ),
      builder: (items) {
        final filteredItems = category == null
            ? items
            : items.where((e) => e.category == category).toList();

        if (filteredItems.isEmpty) {
          return AppEmptyWidget(
            message: LaundryItemStrings.empty,
            icon: AppIcons.items,
          );
        }

        return ListView.separated(
          itemCount: filteredItems.length,

          /// 🔥 item
          itemBuilder: (_, i) {
            return LaundryItemListItem(item: filteredItems[i]);
          },

          /// 🔥 separator
          separatorBuilder: (_, i) => const Divider(),
        );
      },
    );
  }
}
