// =============================================================================
// File        : customer_list_content.dart
// Path        : features/customers/presentation/widgets/customer_list_content.dart
// Layer       : Presentation (UI - Widget)
// -----------------------------------------------------------------------------
// CustomerListContent
//
// Responsibility:
// - Menampilkan UI ketika data customer tersedia
// - Menyediakan search field + list data
//
// Notes:
// - Pure UI (stateless)
// - Tidak ada business logic
// - Search callback di-inject dari luar (decoupled)
// =============================================================================

import 'package:flutter/material.dart';
import '../../domain/entities/customer_entity.dart';
import 'customer_list_view.dart';
import 'customer_search_field.dart';

class CustomerListContent extends StatelessWidget {
  final List<CustomerEntity> data;
  final ValueChanged<String> onSearch;

  const CustomerListContent({
    super.key,
    required this.data,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔍 SEARCH
        CustomerSearchField(onChanged: onSearch),

        /// 📋 LIST
        Expanded(child: CustomerListView(data: data)),
      ],
    );
  }
}
