import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_display_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupCardHeader extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupCardHeader({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Text(group.serviceLabel, style: context.text.titleSmall!.semiBold);
  }
}
