import 'package:app_laundry/core/theme/helpers/avatar_size_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/bottom_sheet/app_action_sheet.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/builders/customer_action_builder.dart';
import 'package:app_laundry/features/customer/presentation/extensions/customer_ui_extension.dart';
import 'package:flutter/material.dart';

class CustomerListItem extends StatelessWidget {
  const CustomerListItem({super.key, required this.customer});

  final CustomerEntity customer;

  @override
  Widget build(BuildContext context) {
    final name = customer.name;
    final phone = customer.phone;

    return ListTile(
      leading: CircleAvatar(
        radius: context.sizes.avatarSm.radius, // 🔥 list = pakai sm, bukan md
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
        final actions = CustomerActionBuilder.build(context, customer);

        AppActionSheet.show(context, title: name, actions: actions);
      },
    );
  }
}
