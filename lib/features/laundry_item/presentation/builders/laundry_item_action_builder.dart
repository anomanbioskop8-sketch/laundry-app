import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/extensions/push/laundry_item_navigation_ext.dart';
import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_intent.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_item.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/auth/permission/permission_service.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryItemActionBuilder {
  final LaundryItemEntity item;
  LaundryItemActionBuilder(this.item);

  static List<ActionItem> build(BuildContext context, LaundryItemEntity item) {
    final canView = sl<PermissionService>().canWith(Permission.canViewCustomer);
    final canUpdate = sl<PermissionService>().can(
      Permission.canUpdateLaundryItem,
    );
    final canDelete = sl<PermissionService>().can(
      Permission.canDeleteLaundryItem,
    );
    return [
      ActionItem(
        title: LaundryItemStrings.view,
        icon: AppIcons.viewDetail,
        intent: ActionIntent.view,
        canShow: () => canView,
        onTap: () => context.pushLaundryPrice(laundryItem: item),
      ),
      ActionItem(
        title: LaundryItemStrings.edit,
        icon: AppIcons.edit,
        intent: ActionIntent.update,
        canShow: () => canUpdate,
        onTap: () => context.pushLaundryItemForm(laundryItem: item),
      ),

      ActionItem(
        title: LaundryItemStrings.delete,
        icon: AppIcons.delete,
        intent: ActionIntent.delete,
        canShow: () => canDelete,
        onTap: () async {
          final confirmed = await AppUIService.confirm(
            title: LaundryItemStrings.delete,
            type: DialogType.alert,
            message: LaundryItemStrings.confirmDelete,
          );

          if (confirmed != true || !context.mounted) return;

          context.read<LaundryItemActionCubit>().delete(item.id);
        },
      ),
    ];
  }
}
