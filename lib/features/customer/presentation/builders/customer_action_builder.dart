// features/customer/presentation/builders/customer_action_builder.dart

import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/ui/bottom_sheet/action_item.dart';
import 'package:app_laundry/core/services/dialog_service.dart';
import 'package:app_laundry/core/services/permission/permission_service.dart';
import 'package:app_laundry/core/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerActionBuilder {
  static List<ActionItem> build(BuildContext context, CustomerEntity customer) {
    final permission = sl<PermissionService>();
    debugPrint("Can Edit Customer: ${permission.canEditCustomer()}");
    debugPrint("Can Edit Customer: ${permission.role}");
    return [
      ActionItem(
        title: 'Edit',
        icon: Icons.edit,
        type: DialogType.info,
        canShow: () => permission.canEditCustomer(),
        onTap: () {
          // navigate edit
        },
      ),

      ActionItem(
        title: 'Hapus',
        icon: Icons.delete,
        type: DialogType.delete,
        canShow: () => true,
        onTap: () async {
          final confirmed = await DialogService.confirm(
            title: 'Hapus Customer',
            type: DialogType.delete,
            message: 'Yakin hapus customer?',
          );

          if (confirmed != true || !context.mounted) return;

          context.read<CustomerActionCubit>().deleteCustomer(
            DeleteCustomerParams(customer.id),
          );
        },
      ),
    ];
  }
}
