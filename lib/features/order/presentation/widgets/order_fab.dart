import 'package:app_laundry/app/router/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderFab extends StatelessWidget {
  const OrderFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'fab_order',
      onPressed: () async {
        // await context.read<OrderActionCubit>().create(
        //   CreateOrderParams(
        //     customerId: '0009b23b-ef4b-4ea0-b1f7-e96e82220194',
        //     items: [],
        //     serviceType: LaundryServiceType.regular,
        //     paymentStatus: PaymentStatus.unpaid,
        //   ),
        // );
        await context.pushNamed(RoutePaths.orderFormName, extra: null);
      },
      child: const Icon(Icons.add),
    );
  }
}
