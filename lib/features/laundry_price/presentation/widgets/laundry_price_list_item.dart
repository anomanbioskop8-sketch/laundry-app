import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/bottom_sheet/app_action_sheet.dart';
import 'package:app_laundry/core/ui/components/avatar/app_icon_avatar.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/extensions/laundry_price_entity_ext.dart';
import 'package:app_laundry/features/laundry_price/presentation/builders/laundry_price_action_builder.dart';
import 'package:flutter/material.dart';

class LaundryPriceListItem extends StatelessWidget {
  const LaundryPriceListItem({super.key, required this.price});

  final LaundryPriceEntity price;

  @override
  Widget build(BuildContext context) {
    final title = price.title;
    final speedLabel = price.speedLabel;
    final speedIcon = price.speedIcon;
    final speedColor = price.speedColor;
    final serviceLabel = price.serviceLabel;
    final formattedPrice = price.formattedPrice;

    return ListTile(
      tileColor: context.colors.surfaceContainer,

      leading: AppIconAvatar(icon: speedIcon, backgroundColor: speedColor),

      title: Text(
        serviceLabel,
        style: context.titleSmall!.semiBold.onSurface(context),
      ),
      subtitle: Text(speedLabel, style: context.bodyMedium!.secondary(context)),
      trailing: Text(
        formattedPrice,
        style: context.titleSmall!.semiBold.primary(context),
      ),

      onTap: () {
        final actions = LaundryPriceActionBuilder.build(context, price);

        AppActionSheet.show(context, title: title, actions: actions);
      },
    );
  }
}
