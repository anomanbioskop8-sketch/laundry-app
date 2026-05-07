import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomerFab extends StatelessWidget {
  const CustomerFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'fab_customer',
      onPressed: () async {
        await context.pushNamed('customerForm', extra: null);
      },
      child: const Icon(Icons.add),
    );
  }
}
