import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerFab extends StatelessWidget {
  const CustomerFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CustomerActionCubit>().createCustomer(
          CreateCustomerParams(
            name: 'Customer ${DateTime.now().millisecondsSinceEpoch}',
            phone: '081234567890',
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
