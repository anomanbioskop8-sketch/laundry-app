import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_laundry_item/order_laundry_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderLaundryItemList extends StatelessWidget {
  final List<OrderLaundryItemEntity> items;

  const OrderLaundryItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (_, index) {
        final item = items[index];

        return OrderLaundryItemCard(
          item: item,
          onDelete: () {
            context.read<OrderGroupFormCubit>().removeItem(item.itemId);
          },
        );
      },
    );
  }
}
