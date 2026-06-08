import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/extensions/push/laundry_price_navigation_ext.dart';
import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/laundry_price_strings.dart';
import 'package:app_laundry/core/ui/bottom_sheets/action_intent.dart';
import 'package:app_laundry/core/ui/bottom_sheets/action_item.dart';
import 'package:app_laundry/core/auth/permission/permission_service.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:flutter/material.dart';

class LaundryPriceActionBuilder {
  final LaundryPriceEntity price;
  LaundryPriceActionBuilder(this.price);

  static List<ActionItem> build(
    BuildContext context,
    LaundryPriceEntity price,
  ) {
    final canUpdate = sl<PermissionService>().can(
      Permission.canUpdateLaundryPrice,
    );

    return [
      ActionItem(
        title: LaundryPriceStrings.edit,
        icon: AppIcons.edit,
        intent: ActionIntent.update,
        canShow: () => canUpdate,
        onTap: () => context.pushLaundryPriceForm(laundryPrice: price),
      ),
    ];
  }
}
