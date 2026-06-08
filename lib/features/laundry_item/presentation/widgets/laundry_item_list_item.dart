import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/bottom_sheets/app_action_sheet.dart';
import 'package:app_laundry/core/ui/widgets/avatar/app_icon_avatar.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/extensions/laundry_item_entity_ext.dart';
import 'package:app_laundry/features/laundry_item/presentation/builders/laundry_item_action_builder.dart';
import 'package:flutter/material.dart';

class LaundryItemListItem extends StatelessWidget {
  const LaundryItemListItem({super.key, required this.item});

  final LaundryItemEntity item;

  @override
  Widget build(BuildContext context) {
    final name = item.name;
    final categorylabel = item.catgoryLabel;
    final categoryIcon = item.categoryIcon;

    return ListTile(
      tileColor: context.colors.surfaceContainer,
      leading: AppIconAvatar(icon: categoryIcon),

      title: Text(
        name,
        style: context.text.titleMedium!.semiBold.onSurface(context),
      ),
      subtitle: Text(
        categorylabel,
        style: context.text.bodyMedium!.onSurfaceVariant(context),
      ),

      onTap: () {
        final actions = LaundryItemActionBuilder.build(context, item);
        AppActionSheet.show(context, title: name, actions: actions);
      },
    );
  }
}
