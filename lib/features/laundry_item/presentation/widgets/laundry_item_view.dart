import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/widgets/laundry_item_list_item.dart';
import 'package:flutter/material.dart';

class LaundryItemView extends StatelessWidget {
  const LaundryItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<LaundryItemCubit, LaundryItemEntity>(
      builder: (items) {
        return ListView.separated(
          itemCount: items.length,

          /// 🔥 item
          itemBuilder: (_, i) {
            return LaundryItemListItem(item: items[i]);
          },

          /// 🔥 separator
          separatorBuilder: (_, i) => const Divider(),
        );
      },
    );
  }
}
