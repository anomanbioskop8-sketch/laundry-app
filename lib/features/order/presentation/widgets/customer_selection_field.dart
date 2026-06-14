import 'package:app_laundry/app/router/extensions/push/customer_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/ui/widgets/feedback/app_selected_item.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/extensions/customer_entity_ext.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerSelectionField extends StatelessWidget {
  const CustomerSelectionField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderFormCubit, OrderFormState>(
      buildWhen: (previous, current) => previous.customer != current.customer,
      builder: (context, state) {
        final customer = state.customer;
        final hasCustomer = customer != null;

        return AppSelectedItem(
          icon: AppIcons.customers,
          title: customer.selectedCustomerName,
          subtitle: customer.selectedCustomerPhone,
          isSelected: hasCustomer,

          onTap: () => _pickCustomer(context),
        );
      },
    );
  }

  Future<void> _pickCustomer(BuildContext context) async {
    final result = await context.goCustomer(isPicker: true);

    if (result is! CustomerEntity || !context.mounted) {
      return;
    }

    context.read<OrderFormCubit>().setCustomer(result);
  }
}
