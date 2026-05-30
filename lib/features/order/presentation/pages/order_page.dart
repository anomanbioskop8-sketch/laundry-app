import 'package:app_laundry/app/router/extensions/push/order_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/ui/components/app_fab.dart';
import 'package:app_laundry/core/ui/search_field.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(OrderStrings.title)),
      body: Column(
        children: [
          /// 🔍 SEARCH BAR
          Padding(
            padding: EdgeInsets.all(context.spacing.lg),
            child: AppSearchField(
              hintText: OrderStrings.searchHint,
              onChanged: context.read<OrderCubit>().search,
            ),
          ),
          const Expanded(child: OrderView()),
        ],
      ),
      floatingActionButton: AppFab(
        onPressed: () => context.pushOrderForm(),
        icon: AppIcons.add,
        heroTag: 'fab_order',
        tooltip: OrderStrings.create,
      ),
    );
  }
}
