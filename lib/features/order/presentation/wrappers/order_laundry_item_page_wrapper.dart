import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_laundry_item_cubit.dart';
import 'package:app_laundry/features/order/presentation/pages/selected_order_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderLaundryItemPageWrapper extends StatelessWidget {
  final StreamOrderLaundryItemsParams params;

  const OrderLaundryItemPageWrapper({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LaundryItemActionCubit>()),
        BlocProvider(create: (_) => sl<OrderItemSelectionCubit>()),
        BlocProvider(create: (_) => sl<OrderGroupFormCubit>()),
        BlocProvider(
          create: (_) => sl<OrderLaundryItemCubit>()..listenOrders(params),
        ),
      ],
      child: const BaseActionListener<LaundryItemActionCubit, void>(
        child: SelectedOrderItemPage(),
      ),
    );
  }
}
