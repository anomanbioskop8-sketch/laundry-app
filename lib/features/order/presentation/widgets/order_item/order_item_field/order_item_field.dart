//lib\features\order\presentation\widgets\order_item\order_item_field\order_item_field.dart

import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_state.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_item/order_item_field/add_order_item_button.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_item/order_item_view/order_item_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemField extends StatelessWidget {
  final StreamOrderLaundryItemsParams params;

  const OrderItemField({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderGroupFormCubit, OrderGroupFormState>(
      buildWhen: (p, c) => p.items != c.items,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddOrderItemButton(params: params),
            context.spacing.md.h,
            OrderItemSection(items: state.items),
          ],
        );
      },
    );
  }
}
