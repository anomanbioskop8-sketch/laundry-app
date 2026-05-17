import 'package:app_laundry/app/router/app_navigation_ext.dart';
import 'package:flutter/material.dart';

class OrderFab extends StatelessWidget {
  const OrderFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'fab_order',
      onPressed: () => context.goOrderForm(),
      child: const Icon(Icons.add),
    );
  }
}
