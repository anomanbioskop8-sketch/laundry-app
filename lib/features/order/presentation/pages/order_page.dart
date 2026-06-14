import 'package:app_laundry/app/router/extensions/push/order_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/navigation/app_fab.dart';
import 'package:app_laundry/core/ui/widgets/forms/search_field.dart';
import 'package:app_laundry/core/ui/widgets/navigation/app_tab_bar.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:app_laundry/features/order/domain/extensions/order_status/order_status_display_ext.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: OrderStatusDisplayExt.labels.length,
      child: Scaffold(
        appBar: AppBar(title: const Text(OrderStrings.title)),
        body: Column(
          children: [
            AppTabBar(
              tabs: OrderStatusDisplayExt.labels,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
            ),

            /// 🔍 SEARCH BAR
            Padding(
              padding: EdgeInsets.all(context.spacing.md),
              child: AppSearchField(
                hintText: OrderStrings.searchHint,
                onChanged: context.read<OrderCubit>().search,
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  const OrderView(), // Semua
                  ...OrderStatus.values.map(
                    (status) => OrderView(status: status),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: AppFab(
          onPressed: () => context.pushOrderForm(),
          icon: AppIcons.add,
          heroTag: 'fab_order',
          tooltip: OrderStrings.create,
        ),
      ),
    );
  }
}
