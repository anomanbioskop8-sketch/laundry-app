import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:app_laundry/features/order/presentation/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPageWrapper extends StatelessWidget {
  const OrderPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<OrderActionCubit>()),
        BlocProvider(create: (_) => sl<OrderCubit>()..listenOrders()),
      ],
      child: const BaseActionListener<OrderActionCubit, void>(
        child: OrderPage(),
      ),
    );
  }
}
