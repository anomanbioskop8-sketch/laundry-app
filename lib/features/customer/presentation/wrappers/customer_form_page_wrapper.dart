import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/action/base_action_listener.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerFormPageWrapper extends StatelessWidget {
  final CustomerEntity? customer;

  const CustomerFormPageWrapper({super.key, this.customer});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<CustomerActionCubit>())],
      child: BaseActionListener<CustomerActionCubit, void>(
        popOnSuccess: true,
        child: CustomerFormPage(customer: customer),
      ),
    );
  }
}
