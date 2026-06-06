// =============================================================================
// File        : customer_page.dart
// Path        : lib/features/customer/presentation/pages/customer_page.dart
// =============================================================================

import 'package:app_laundry/app/router/extensions/push/customer_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/extensions/theme_spacing_ext.dart';
import 'package:app_laundry/core/ui/components/app_fab.dart';
import 'package:app_laundry/core/ui/search_field.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPage extends StatelessWidget {
  final bool isPicker;

  const CustomerPage({super.key, this.isPicker = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isPicker ? 'Pilih ${CustomerStrings.title}' : CustomerStrings.title,
        ),
      ),

      body: Column(
        children: [
          // =========================
          // SEARCH BAR
          // =========================
          Padding(
            padding: EdgeInsets.all(context.spacing.md),

            child: AppSearchField(
              prefixIcon: AppIcons.searchCustomers,
              hintText: CustomerStrings.searchHint,
              onChanged: context.read<CustomerCubit>().search,
            ),
          ),

          // =========================
          // LIST
          // =========================
          Expanded(child: CustomerView(isPicker: isPicker)),
        ],
      ),

      floatingActionButton: isPicker
          ? null
          : AppFab(
              icon: AppIcons.addCustomers,
              tooltip: CustomerStrings.create,
              heroTag: 'fab_customer',
              onPressed: () => context.pushCustomerForm(),
            ),
    );
  }
}
