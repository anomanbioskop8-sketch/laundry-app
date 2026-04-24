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

import 'package:app_laundry/core/base/widgets/base_list_view.dart';
import 'package:app_laundry/features/customers/data/mappers/customer_mapper.dart';
import 'package:app_laundry/features/customers/presentation/mapper/customer_ui_mapper.dart';
import 'package:app_laundry/features/customers/presentation/models/customer_ui_model.dart';
import 'package:app_laundry/features/customers/presentation/widgets/customer_list_item.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/customer_entity.dart';
import 'customer_search_field.dart';

class CustomerListContent extends StatelessWidget {
  final List<CustomerEntity> data;

  /// 🔍 Search callback
  final ValueChanged<String> onSearch;

  /// 👆 Item click callback (inject dari luar)
  final Function(CustomerUIModel customer) onItemTap;

  const CustomerListContent({
    super.key,
    required this.data,
    required this.onSearch,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // =========================
        // SEARCH
        // =========================
        CustomerSearchField(onChanged: onSearch),

        // =========================
        // LIST
        // =========================
        Expanded(
          child: BaseListView<CustomerUIModel>(
            data: CustomerUIMapper.toUIList(data),

            // =========================
            // ITEM UI
            // =========================
            itemBuilder: (_, customer, _) {
              return CustomerListItem(customer: customer);
            },

            // =========================
            // TAP
            // =========================
            onItemTap: onItemTap,
          ),
        ),
      ],
    );
  }
}
