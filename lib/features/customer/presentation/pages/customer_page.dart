import 'package:app_laundry/core/base/ui/search_field.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_fab.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      body: Column(
        children: [
          /// 🔍 SEARCH BAR
          Padding(
            padding: EdgeInsets.all(context.spacing.lg),
            child: AppSearchField(
              hintText: 'Cari nama atau nomor...',
              onChanged: context.read<CustomerCubit>().search,
            ),
          ),

          /// 📋 LIST
          const Expanded(child: CustomerView()),
        ],
      ),
      floatingActionButton: const CustomerFab(),
    );
  }
}
