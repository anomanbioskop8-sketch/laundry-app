//lib\features\order\presentation\widgets\order_group\order_group_list.dart

import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_card/order_group_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderGroupList extends StatelessWidget {
  final List<OrderGroupEntity> groups;

  const OrderGroupList({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: groups.length,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (_, index) {
        return OrderGroupCard(
          group: groups[index],
          onDelete: () {
            context.read<OrderFormCubit>().removeGroup(groups[index]);
          },
        );
      },
    );
  }
}
