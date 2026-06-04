// =============================================================================
// File : order_confirmation_page.dart
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_elevated_action_button.dart';
import 'package:app_laundry/core/ui/components/app_info_card.dart';
import 'package:app_laundry/core/ui/components/info_info_item.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationPage extends StatelessWidget {
  final CreateOrderParams order;

  const OrderConfirmationPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(OrderStrings.confirm)),

      body: ListView(
        padding: EdgeInsets.all(context.spacing.md),

        children: [
          AppInfoCard(
            items: [
              AppInfoItem(
                label: CustomerStrings.title,
                icon: AppIcons.customers,
                value: order.customer.name,
              ),
              AppInfoItem(
                label: 'Created At',
                icon: AppIcons.createdAt,
                value: order.customer.name,
              ),
            ],
          ),

          context.spacing.lg.h,

          ...order.groups.map(
            (group) => Padding(
              padding: EdgeInsets.only(bottom: context.spacing.md),
              child: OrderGroupCard(group: group),
            ),
          ),

          AppElevatedActionButton(
            label: OrderStrings.confirm,
            onPressed: () {
              context.read<OrderActionCubit>().create(order);
            },
          ),
        ],
      ),
    );
  }
}
