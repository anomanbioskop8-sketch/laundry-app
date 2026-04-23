import 'package:app_laundry/core/base/form/base_form_state.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerFormView extends StatelessWidget {
  const CustomerFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomerFormCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Customer')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 NAME
            BlocBuilder<CustomerFormCubit, BaseFormState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (v) => cubit.setField('name', v),
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    errorText: state.errors['name'],
                    border: const OutlineInputBorder(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // 🔹 PHONE
            BlocBuilder<CustomerFormCubit, BaseFormState>(
              builder: (context, state) {
                return TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (v) => cubit.setField('phone', v),
                  decoration: InputDecoration(
                    labelText: 'No HP',
                    errorText: state.errors['phone'],
                    border: const OutlineInputBorder(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // 🔹 ADDRESS
            TextField(
              onChanged: (v) => cubit.setField('address', v),
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 24),

            // 🔹 SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await cubit.submit();

                  if (context.mounted) {
                    final state = context.read<CustomerFormCubit>().state;

                    if (state.message != null &&
                        !state.isLoading &&
                        state.errors.isEmpty) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
