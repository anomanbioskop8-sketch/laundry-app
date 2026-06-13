import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_list.dart';
import 'package:flutter/material.dart';

class OrderGroupsSection extends StatelessWidget {
  final List<OrderGroupEntity> groups;

  const OrderGroupsSection({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      return const AppEmptyWidget(
        message: OrderStrings.emptyGroup,
        icon: AppIcons.order,
      );
    }

    return OrderGroupList(groups: groups);
  }
}
