// =============================================================================
// File        : customer_view.dart
// Path        : lib/features/customer/presentation/widgets/customer_view.dart
// =============================================================================

import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_list_item.dart';
import 'package:flutter/material.dart';

class CustomerView extends StatelessWidget {
  final bool isPicker;

  const CustomerView({super.key, this.isPicker = false});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<CustomerCubit, CustomerEntity>(
      empty: AppEmptyWidget(message: CustomerStrings.empty),
      builder: (customers) {
        return ListView.separated(
          itemCount: customers.length,

          itemBuilder: (_, i) {
            return CustomerListItem(customer: customers[i], isPicker: isPicker);
          },

          separatorBuilder: (_, i) {
            return const Divider();
          },
        );
      },
    );
  }
}
