// =============================================================================
// File        : customer_list_item.dart
// Path        : lib/features/customer/presentation/widgets/customer_list_item.dart
// =============================================================================

import 'package:app_laundry/core/theme/helpers/avatar_size_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/bottom_sheet/app_action_sheet.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/builders/customer_action_builder.dart';
import 'package:app_laundry/features/customer/presentation/extensions/customer_ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomerListItem extends StatelessWidget {
  final CustomerEntity customer;
  final bool isPicker;

  const CustomerListItem({
    super.key,
    required this.customer,
    this.isPicker = false,
  });

  @override
  Widget build(BuildContext context) {
    final name = customer.name;
    final phone = customer.phone;

    return ListTile(
      tileColor: context.colors.surfaceContainer,

      leading: CircleAvatar(
        radius: context.sizes.avatarSm.radius,
        backgroundColor: customer.avatarColor,

        child: Text(
          customer.initials,
          style: context.titleSmall!.semiBold.onPrimary(context),
        ),
      ),

      title: Text(
        customer.displayName,
        style: context.titleSmall!.semiBold.onSurface(context),
      ),

      subtitle: Text(phone, style: context.bodyMedium!.secondary(context)),

      onTap: () {
        // =========================
        // PICKER MODE
        // =========================

        if (isPicker) {
          context.pop(customer);
          return;
        }

        // =========================
        // ACTION SHEET
        // =========================

        final actions = CustomerActionBuilder.build(context, customer);

        AppActionSheet.show(context, title: name, actions: actions);
      },
    );
  }
}
