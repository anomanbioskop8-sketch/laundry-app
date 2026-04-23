// =============================================================================
// File        : customer_empty_content.dart
// Path        : features/customers/presentation/widgets/customer_empty_content.dart
// Layer       : Presentation (UI - Widget)
// -----------------------------------------------------------------------------
// CustomerEmptyContent
//
// Responsibility:
// - Menampilkan UI ketika data kosong
// - Tetap menyediakan search agar user bisa filter
//
// Notes:
// - Pure UI
// - Reusable
// =============================================================================

import 'package:flutter/material.dart';
import 'customer_search_field.dart';

class CustomerEmptyContent extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const CustomerEmptyContent({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔍 SEARCH
        CustomerSearchField(onChanged: onSearch),

        /// 📭 EMPTY STATE
        const Expanded(child: Center(child: Text('Belum ada customer'))),
      ],
    );
  }
}
