import 'package:app_laundry/core/base/ui/bottom_sheet/action_item.dart';
import 'package:app_laundry/core/base/ui/bottom_sheet/app_action_sheet.dart';
import 'package:app_laundry/core/services/dialog_service.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/presentation/builders/customer_action_builder.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListItem extends StatelessWidget {
  const CustomerListItem({super.key, required this.customer});

  final CustomerEntity customer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customer.name),
      subtitle: Text(customer.phone),
      onTap: () {
        final actions = CustomerActionBuilder.build(context, customer);

        AppActionSheet.show(context, title: customer.name, actions: actions);
      },
    );
  }
}
