// =============================================================================
// File        : selected_order_item_page.dart
// Path        : lib/features/order/presentation/pages/selected_order_item_page.dart
// =============================================================================

import 'package:flutter/material.dart';

import '../widgets/selected_order_item/selected_order_item_view.dart';

class SelectedOrderItemPage extends StatelessWidget {
  const SelectedOrderItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Item')),
      body: SelectedOrderItemView(),
    );
  }
}
