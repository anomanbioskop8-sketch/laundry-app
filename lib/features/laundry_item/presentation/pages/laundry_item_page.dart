import 'package:app_laundry/app/router/extensions/push/laundry_item_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/navigation/app_fab.dart';
import 'package:app_laundry/core/ui/widgets/forms/search_field.dart';
import 'package:app_laundry/core/ui/widgets/navigation/app_tab_bar.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/laundry_item/domain/extensions/laundry_item_category_ext.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/widgets/laundry_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryItemPage extends StatelessWidget {
  const LaundryItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: LaundryItemCategory.values.length + 1,
      child: Scaffold(
        appBar: AppBar(title: const Text(LaundryItemStrings.title)),
        body: Column(
          children: [
            AppTabBar(
              tabs: LaundryItemCategoryExt.labels,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
            ),

            /// 🔍 SEARCH BAR
            Padding(
              padding: EdgeInsets.all(context.spacing.md),
              child: AppSearchField(
                hintText: LaundryItemStrings.searchHint,
                onChanged: context.read<LaundryItemCubit>().search,
              ),
            ),

            /// 📋 LIST
            Expanded(
              child: TabBarView(
                children: [
                  const LaundryItemView(), // Semua
                  ...LaundryItemCategory.values.map(
                    (category) => LaundryItemView(category: category),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: AppFab(
          icon: AppIcons.add,
          tooltip: LaundryItemStrings.add,
          heroTag: 'fab_laundry_item',
          onPressed: () => context.pushLaundryItemForm(),
        ),
      ),
    );
  }
}
