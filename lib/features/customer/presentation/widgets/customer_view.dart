import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_laundry/core/base/cubit/base_stream_state.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, BaseStreamState<CustomerEntity>>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),

          empty: () => const Center(child: Text("Belum ada customer")),

          error: (msg) => Center(child: Text(msg)),

          loaded: (customers) {
            return ListView.builder(
              itemCount: customers.length,
              itemBuilder: (_, i) {
                return CustomerListItem(customer: customers[i]);
              },
            );
          },
        );
      },
    );
  }
}
