//lib\features\order\presentation\widgets\order_group\order_group_field\add_order_group_button.dart

import 'package:app_laundry/app/router/extensions/push/order_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_outlined_action_button.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderGroupButton extends StatelessWidget {
  const AddOrderGroupButton({super.key});

  Future<void> _addGroup(BuildContext context) async {
    final result = await context.pushOrderGroupForm();
    if (result == null || !context.mounted) return;

    final cubit = context.read<OrderFormCubit>();
    cubit.addGroup(result);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppOutlinedActionButton(
        onPressed: () => _addGroup(context),
        icon: AppIcons.add,
        label: OrderStrings.addGroup,
      ),
    );
  }
}
