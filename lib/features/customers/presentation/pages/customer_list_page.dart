import 'package:app_laundry/core/base/cubit/base_state.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/customer_cubit.dart';
import '../cubit/customer_state.dart';
import '../widgets/customer_list_view.dart';
import '../widgets/customer_search_field.dart';
//import 'customer_form_page.dart';

class CustomerListPage extends StatefulWidget {
  final String companyId;

  const CustomerListPage({super.key, required this.companyId});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  String keyword = '';

  @override
  void initState() {
    super.initState();
    context.read<CustomerCubit>().listen(widget.companyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer')),
      body: Column(
        children: [
          CustomerSearchField(
            onChanged: (value) {
              setState(() => keyword = value);
            },
          ),

          Expanded(
            child: BlocBuilder<CustomerCubit, BaseState<List<CustomerEntity>>>(
              builder: (context, state) {
                if (state is BaseLoading<List<CustomerEntity>>) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is BaseError<List<CustomerEntity>>) {
                  return Center(child: Text(state.message));
                }

                if (state is BaseEmpty) {
                  return const Center(child: Text('Belum ada customer'));
                }

                if (state is BaseSuccess<List<CustomerEntity>>) {
                  final filtered = state.data
                      .where(
                        (e) => e.name.toLowerCase().contains(
                          keyword.toLowerCase(),
                        ),
                      )
                      .toList();

                  return CustomerListView(data: filtered);
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const CustomerFormPage(),
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
