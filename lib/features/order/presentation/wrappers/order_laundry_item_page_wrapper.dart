import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/pages/laundry_item_page.dart';
import 'package:app_laundry/features/laundry_price/presentation/cubit/laundry_price_cubit.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_laundry_item_cubit.dart';
import 'package:app_laundry/features/order/presentation/pages/selected_order_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderLaundryItemPageWrapper extends StatelessWidget {
  const OrderLaundryItemPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LaundryItemActionCubit>()),
        BlocProvider(
          create: (_) => sl<OrderLaundryItemCubit>()
            ..listenOrders(
              StreamOrderLaundryItemsParams(
                serviceType: LaundryServiceType.wash,
                speedType: LaundrySpeedType.regular,
              ),
            ),
        ),
      ],
      child: const BaseActionListener<LaundryItemActionCubit, void>(
        child: SelectedOrderItemPage(),
      ),
    );
  }
}
