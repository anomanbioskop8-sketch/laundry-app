import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_detail_page.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailPageWrapper extends StatelessWidget {
  final CustomerEntity customer;

  const CustomerDetailPageWrapper({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<OrderActionCubit>()),
        BlocProvider(create: (_) => sl<OrderCubit>()..listenOrders()),
      ],
      child: BaseActionListener<OrderActionCubit, void>(
        popOnSuccess: true,
        child: CustomerDetailPage(customer: customer),
      ),
    );
  }
}
