// =============================================================================
// File        : selected_order_item_page.dart
// Path        : lib/features/order/presentation/pages/selected_order_item_page.dart
// =============================================================================

import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/forms/search_field.dart';
import 'package:app_laundry/core/ui/widgets/navigation/app_tab_bar.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/laundry_item/domain/extensions/laundry_item_category_ext.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_laundry_item_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_item_selection/save_order_item_selection_button.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_item_selection/order_item_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemSelectionPage extends StatelessWidget {
  const OrderItemSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: LaundryItemCategoryExt.labels.length,
      child: Scaffold(
        appBar: AppBar(title: const Text('Pilih Item')),
        body: Column(
          children: [
            AppTabBar(
              tabs: LaundryItemCategoryExt.labels,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
            ),

            Padding(
              padding: EdgeInsets.all(context.spacing.md),
              child: AppSearchField(
                hintText: LaundryItemStrings.searchHint,
                onChanged: context.read<OrderLaundryItemCubit>().search,
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  const OrderItemSelectionView(),
                  ...LaundryItemCategory.values.map(
                    (category) => OrderItemSelectionView(category: category),
                  ),
                ],
              ),
            ),

            const SaveOrderItemSelectionButton(),
          ],
        ),
      ),
    );
  }
}
