// =============================================================================
// File        : customer_page.dart
// Path        : lib/features/customer/presentation/pages/customer_page.dart
// =============================================================================

import 'package:app_laundry/core/ui/search_field.dart';
import 'package:app_laundry/core/constants/customer_strings.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_fab.dart';
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
            padding: EdgeInsets.all(context.spacing.lg),

            child: AppSearchField(
              hintText: 'Cari nama atau nomor...',
              onChanged: context.read<CustomerCubit>().search,
            ),
          ),

          // =========================
          // LIST
          // =========================
          Expanded(child: CustomerView(isPicker: isPicker)),
        ],
      ),

      floatingActionButton: isPicker ? null : const CustomerFab(),
    );
  }
}
