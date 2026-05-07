import 'package:app_laundry/core/theme/helpers/avatar_size_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/bottom_sheet/app_action_sheet.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/laundry_item/presentation/builders/laundry_item_action_builder.dart';
import 'package:flutter/material.dart';

class LaundryItemListItem extends StatelessWidget {
  const LaundryItemListItem({super.key, required this.item});

  final LaundryItemEntity item;

  @override
  Widget build(BuildContext context) {
    final name = item.name;
    final category = item.category;

    return ListTile(
      leading: CircleAvatar(
        radius: context.sizes.avatarSm.radius, // 🔥 list = pakai sm, bukan md
        //backgroundColor: customer.avatarColor,
        child: Icon(category.icon),
      ),

      title: Text(name, style: context.titleSmall!.semiBold.onSurface(context)),
      subtitle: Text(
        category.label,
        style: context.bodyMedium!.secondary(context),
      ),

      onTap: () {
        final actions = LaundryItemActionBuilder.build(context, item);

        AppActionSheet.show(context, title: name, actions: actions);
      },
    );
  }
}
