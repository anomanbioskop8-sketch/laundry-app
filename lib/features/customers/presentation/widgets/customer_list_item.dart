// =============================================================================
// File        : customer_list_item.dart
// Layer       : Presentation (UI - Component)
// -----------------------------------------------------------------------------
// CustomerListItem
//
// Responsibility:
// - Menampilkan 1 item customer
// - Trigger event (onDelete)
//
// Notes:
// - Pure UI
// =============================================================================

import 'package:app_laundry/features/customers/presentation/models/customer_ui_model.dart';
import 'package:flutter/material.dart';

class CustomerListItem extends StatelessWidget {
  final CustomerUIModel customer;

  const CustomerListItem({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(customer.name),
      subtitle: Text(customer.subtitle),
    );
  }
}
