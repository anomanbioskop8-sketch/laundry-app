// =============================================================================
// File : order_confirmation_page.dart
// =============================================================================

import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_elevated_action_button.dart';
import 'package:app_laundry/core/ui/widgets/navigation/app_tab_bar.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_confirmation/order_info_card.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_detail_card/order_group_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationPage extends StatelessWidget {
  final CreateOrderParams order;

  const OrderConfirmationPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text(OrderStrings.confirm)),

        body: Column(
          children: [
            AppTabBar(tabs: const ['Informasi', 'Item']),
            Expanded(
              child: TabBarView(
                children: [
                  OrderInfoCard(order: order),
                  ListView.separated(
                    padding: EdgeInsets.all(context.spacing.md),
                    itemCount: order.groups.length,
                    separatorBuilder: (_, _) => Divider(),
                    itemBuilder: (_, index) {
                      return OrderGroupDetailCard(group: order.groups[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(context.spacing.md),
            child: AppElevatedActionButton(
              label: OrderStrings.confirm,
              onPressed: () {
                context.read<OrderActionCubit>().create(order);
              },
            ),
          ),
        ),
      ),
    );
  }
}
