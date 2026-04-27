import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      body: BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const CircularProgressIndicator(),
            empty: () => const Text("Belum ada customer"),
            error: (msg) => Text(msg),
            loaded: (customers) {
              return ListView.builder(
                itemCount: customers.length,
                itemBuilder: (_, i) {
                  final c = customers[i];
                  return ListTile(
                    title: Text(c.name),
                    subtitle: Text(c.phone),
                    onTap: () {
                      context.read<CustomerActionCubit>().deleteCustomer(
                        DeleteCustomerParams(c.id),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),

      //Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CustomerActionCubit>().createCustomer(
            CreateCustomerParams(
              name: 'Customer ${DateTime.now().millisecondsSinceEpoch}',
              phone: '081234567890',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomerPageWrapper extends StatelessWidget {
  const CustomerPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CustomerActionCubit>()),
        BlocProvider(create: (_) => sl<CustomerCubit>()..listenCustomers()),
      ],
      child: const CustomerPage(),
    );
  }
}
