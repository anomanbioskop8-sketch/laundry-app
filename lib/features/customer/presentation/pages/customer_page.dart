import 'package:app_laundry/features/customer/presentation/widgets/customer_fab.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_view.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      body: const CustomerView(),
      floatingActionButton: const CustomerFab(),
    );
  }
}
