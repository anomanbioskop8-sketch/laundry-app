//lib\features\order\presentation\widgets\order_group\order_group_field\order_group_field.dart

import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_state.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_field/add_order_group_button.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_view/order_groups_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderGroupField extends StatelessWidget {
  const OrderGroupField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderFormCubit, OrderFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddOrderGroupButton(),
            context.spacing.md.h,
            OrderGroupsSection(groups: state.groups),
          ],
        );
      },
    );
  }
}
