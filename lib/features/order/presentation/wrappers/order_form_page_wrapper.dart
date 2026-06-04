import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/pages/order_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderFormPageWrapper extends StatelessWidget {
  final OrderEntity? item;

  const OrderFormPageWrapper({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CustomerCubit>()..listenCustomers()),
        BlocProvider(create: (_) => sl<OrderActionCubit>()),
        BlocProvider(create: (_) => sl<OrderFormCubit>()),
      ],
      child: BaseActionListener<OrderActionCubit, void>(
        popOnSuccess: true,
        child: OrderFormPage(),
      ),
    );
  }
}
