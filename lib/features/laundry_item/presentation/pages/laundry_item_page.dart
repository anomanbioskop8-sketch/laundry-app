import 'package:app_laundry/app/router/extensions/push/laundry_item_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/core/ui/components/app_fab.dart';
import 'package:app_laundry/core/ui/search_field.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/widgets/laundry_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryItemPage extends StatelessWidget {
  const LaundryItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LaundryItemStrings.title)),
      body: Column(
        children: [
          /// 🔍 SEARCH BAR
          Padding(
            padding: EdgeInsets.all(context.spacing.lg),
            child: AppSearchField(
              hintText: LaundryItemStrings.searchHint,
              onChanged: context.read<LaundryItemCubit>().search,
            ),
          ),

          /// 📋 LIST
          const Expanded(child: LaundryItemView()),
        ],
      ),
      floatingActionButton: AppFab(
        icon: AppIcons.add,
        tooltip: LaundryItemStrings.add,
        heroTag: 'fab_laundry_item',
        onPressed: () => context.pushLaundryItemForm(),
      ),
    );
  }
}
