import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPageWrapper extends StatelessWidget {
  final bool isPicker;
  const CustomerPageWrapper({super.key, this.isPicker = false});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CustomerActionCubit>()),
        BlocProvider(create: (_) => sl<CustomerCubit>()..listenCustomers()),
      ],
      child: BaseActionListener<CustomerActionCubit, void>(
        child: CustomerPage(isPicker: isPicker),
      ),
    );
  }
}
