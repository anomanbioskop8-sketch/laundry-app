import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_intent.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_item.dart';
import 'package:app_laundry/core/auth/permission/permission_service.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        title: 'Edit',
        icon: Icons.edit_outlined,
        intent: ActionIntent.update,
        canShow: () => canUpdate,
        onTap: () async {
          await context.pushNamed(
            RoutePaths.laundryPriceFormName,
            extra: price,
          );
        },
      ),
    ];
  }
}
