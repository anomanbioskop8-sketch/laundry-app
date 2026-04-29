import 'package:app_laundry/core/base/ui/wrapper/base_stream_wrapper.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customer/presentation/widgets/customer_list_item.dart';
import 'package:flutter/material.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStreamWrapper<CustomerCubit, CustomerEntity>(
      builder: (customers) {
        return ListView.separated(
          itemCount: customers.length,

          /// 🔥 item
          itemBuilder: (_, i) {
            return CustomerListItem(customer: customers[i]);
          },

          /// 🔥 separator
          separatorBuilder: (_, i) => const Divider(height: 1, thickness: 0.5),
        );
      },
    );
  }
}
