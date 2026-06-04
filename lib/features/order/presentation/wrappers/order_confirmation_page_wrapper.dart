import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/extensions/go/auth_navigation_ext.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:app_laundry/features/order/presentation/pages/order_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationPageWrapper extends StatelessWidget {
  final CreateOrderParams order;

  const OrderConfirmationPageWrapper({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<OrderActionCubit>())],
      child: BaseActionListener<OrderActionCubit, void>(
        onNavigate: (context, _) => context.goMain(),
        child: OrderConfirmationPage(order: order),
      ),
    );
  }
}
