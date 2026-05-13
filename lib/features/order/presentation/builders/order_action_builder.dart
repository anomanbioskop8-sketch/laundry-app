import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/constants/order_strings.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_intent.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_item.dart';
import 'package:app_laundry/core/auth/permission/permission_service.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/order_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderActionBuilder {
  final OrderEntity order;

  OrderActionBuilder({required this.order});

  static List<ActionItem> build(BuildContext context, OrderEntity order) {
    final canChangeStatus = sl<PermissionService>().can(
      Permission.canChangeStatus,
    );
    final canPay = sl<PermissionService>().can(Permission.canPayOrder);
    final canDelete = sl<PermissionService>().can(Permission.canDeleteOrder);

    return [
      ActionItem(
        title: order.orderStatus.actionLabel,
        icon: Icons.payment,
        intent: ActionIntent.update,
        canShow: () => canChangeStatus,
        onTap: () async {
          final confirmed = await AppUIService.confirm(
            title: order.orderStatus.actionLabel,
            type: DialogType.info,
            message: order.orderStatus.confirmMessage,
          );

          if (confirmed != true || !context.mounted) return;

          context.read<OrderActionCubit>().changeStatus(order);
        },
      ),
      ActionItem(
        title: OrderStrings.pay,
        icon: Icons.payment,
        intent: ActionIntent.update,
        canShow: () => canPay,
        onTap: () async {
          final confirmed = await AppUIService.confirm(
            title: OrderStrings.pay,
            type: DialogType.info,
            message: OrderStrings.confirmPay,
          );

          if (confirmed != true || !context.mounted) return;

          context.read<OrderActionCubit>().pay(
            PayOrderParams(order: order, amount: 50000),
          );
        },
      ),
      ActionItem(
        title: OrderStrings.delete,
        icon: Icons.delete_outline,
        intent: ActionIntent.delete,
        canShow: () => canDelete,
        onTap: () async {
          final confirmed = await AppUIService.confirm(
            title: OrderStrings.delete,
            type: DialogType.danger,
            message: OrderStrings.confirmDelete,
          );

          if (confirmed != true || !context.mounted) return;

          context.read<OrderActionCubit>().delete(order.id);
        },
      ),
    ];
  }
}
