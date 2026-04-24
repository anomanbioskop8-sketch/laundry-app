// =============================================================================
// File        : customer_action_builder.dart
// Layer       : Presentation (Builder / Mapper)
// =============================================================================

import 'package:app_laundry/features/customers/presentation/models/customer_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_laundry/core/saas/ui/widgets/base_action_item.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';

import '../cubit/customer_action_cubit.dart';

class CustomerActionBuilder {
  static List<BaseActionItem> build(
    BuildContext context,
    CustomerUIModel customer,
  ) {
    return [
      // =========================
      // DETAIL
      // =========================
      BaseActionItem(
        label: 'Detail',
        icon: Icons.info,
        onTap: () {
          Navigator.pop(context);
          // TODO: navigate to detail
        },
      ),

      // =========================
      // EDIT
      // =========================
      BaseActionItem(
        label: 'Edit',
        icon: Icons.edit,
        onTap: () {
          Navigator.pop(context);
          // TODO: navigate to edit
        },
      ),

      // =========================
      // DELETE
      // =========================
      BaseActionItem(
        label: 'Hapus',
        icon: Icons.delete,
        color: Colors.red,
        onTap: () async {
          Navigator.pop(context);

          final confirm = await AppUIService.confirm(
            title: 'Hapus Customer',
            message: 'Yakin hapus ${customer.name}?',
          );

          if (!confirm) return;

          context.read<CustomerActionCubit>().delete(customer.id);
        },
      ),
    ];
  }
}
