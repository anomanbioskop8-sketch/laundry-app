import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/core/auth/permission/permission.dart';
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
import 'package:go_router/go_router.dart';

class LaundryItemActionBuilder {
  final LaundryItemEntity item;
  LaundryItemActionBuilder(this.item);

  static List<ActionItem> build(BuildContext context, LaundryItemEntity item) {
    //final canView = sl<PermissionService>().canWith(Permission.canViewCustomer);
    final canUpdate = sl<PermissionService>().can(
      Permission.canUpdateLaundryItem,
    );
    final canDelete = sl<PermissionService>().can(
      Permission.canDeleteLaundryItem,
    );
    return [
      ActionItem(
        title: 'View',
        icon: Icons.view_agenda,
        intent: ActionIntent.view,
        canShow: () => canUpdate,
        onTap: () async {
          await context.pushNamed(
            LaundryPricePaths.laundryPriceName,
            extra: item,
          );
        },
      ),
      ActionItem(
        title: 'Edit',
        icon: Icons.edit_outlined,
        intent: ActionIntent.update,
        canShow: () => canUpdate,
        onTap: () async {
          await context.pushNamed(
            LaundryItemPaths.laundryItemFormName,
            extra: item,
          );
        },
      ),

      ActionItem(
        title: LaundryItemStrings.delete,
        icon: Icons.delete_outline,
        intent: ActionIntent.delete,
        canShow: () => canDelete,
        onTap: () async {
          final confirmed = await AppUIService.confirm(
            title: LaundryItemStrings.delete,
            type: DialogType.danger,
            message: LaundryItemStrings.confirmDelete,
          );

          if (confirmed != true || !context.mounted) return;

          context.read<LaundryItemActionCubit>().delete(item.id);
        },
      ),
    ];
  }
}
