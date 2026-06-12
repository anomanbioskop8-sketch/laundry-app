import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_price_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupDetailWeightTile extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupDetailWeightTile({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,

      title: Text(
        'Berat Cucian',
        style: context.text.labelMedium!.onSurfaceVariant(context),
      ),

      subtitle: Text(
        '${group.weight ?? 0} Kg',
        style: context.text.titleSmall!.semiBold,
      ),

      trailing: Text(
        group.formattedPrice,
        style: context.text.labelLarge?.semiBold,
      ),
    );
  }
}
