import 'package:app_laundry/features/customers/presentation/cubit/customer_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/customer_entity.dart';

class CustomerListView extends StatelessWidget {
  final List<CustomerEntity> data;

  const CustomerListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, i) {
        final c = data[i];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            title: Text(c.name),
            subtitle: Text('${c.phone} • ${c.address}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<CustomerActionCubit>().delete(c.id);
              },
            ),
          ),
        );
      },
    );
  }
}
