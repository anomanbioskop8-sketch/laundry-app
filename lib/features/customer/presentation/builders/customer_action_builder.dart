// =============================================================================
// File        : customer_action_builder.dart
// Path        : lib/features/customer/presentation/builders/customer_action_builder.dart
// Layer       : Presentation (Builder)
// -----------------------------------------------------------------------------
// Fungsi:
// - Membangun daftar action menu untuk customer
// - Mengatur visibilitas action berdasarkan permission user
// - Menyediakan aksi:
//   - View detail customer
//   - Edit customer
//   - Delete customer
// - Menangani konfirmasi sebelum proses delete dijalankan
// - Menghubungkan UI dengan navigation dan CustomerActionCubit
// =============================================================================

import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_intent.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_item.dart';
import 'package:app_laundry/core/constants/customer_strings.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/auth/permission/permission_service.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomerActionBuilder {
  final CustomerEntity customer;

  CustomerActionBuilder(this.customer);

  /// Membangun daftar action customer
  static List<ActionItem> build(BuildContext context, CustomerEntity customer) {
    // final canView =
    //     sl<PermissionService>().canWith(Permission.canViewCustomer);

    final canUpdate = sl<PermissionService>().canWith(
      Permission.canUpdateCustomer,
    );

    final canDelete = sl<PermissionService>().canWith(
      Permission.canDeleteCustomer,
      resource: customer,
    );

    return [
      /// =========================
      /// VIEW CUSTOMER
      /// =========================
      ActionItem(
        title: 'View',
        icon: Icons.view_agenda,
        intent: ActionIntent.view,
        canShow: () => canUpdate,
        onTap: () async {
          await context.pushNamed(
            RoutePaths.customerDetailName,
            extra: customer,
          );
        },
      ),

      /// =========================
      /// EDIT CUSTOMER
      /// =========================
      ActionItem(
        title: 'Edit',
        icon: Icons.edit_outlined,
        intent: ActionIntent.update,
        canShow: () => canUpdate,
        onTap: () async {
          await context.pushNamed(RoutePaths.customerFormName, extra: customer);
        },
      ),

      /// =========================
      /// DELETE CUSTOMER
      /// =========================
      ActionItem(
        title: CustomerStrings.delete,
        icon: Icons.delete_outline,
        intent: ActionIntent.delete,
        canShow: () => canDelete,
        onTap: () async {
          final confirmed = await AppUIService.confirm(
            title: CustomerStrings.delete,
            type: DialogType.danger,
            message: CustomerStrings.confirmDelete,
          );

          if (confirmed != true || !context.mounted) return;

          context.read<CustomerActionCubit>().deleteCustomer(customer.id);
        },
      ),
    ];
  }
}
