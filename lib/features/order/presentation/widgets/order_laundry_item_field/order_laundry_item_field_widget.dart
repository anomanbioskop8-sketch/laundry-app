import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_state.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_laundry_item_field/order_laundry_item_add_button.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_laundry_item_field/order_laundry_item_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderLaundryItemFieldWidget extends StatelessWidget {
  const OrderLaundryItemFieldWidget({super.key, required this.params});

  final StreamOrderLaundryItemsParams params;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderGroupFormCubit, OrderGroupFormState>(
      buildWhen: (p, c) => p.items != c.items,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderLaundryItemAddButton(params: params),

            context.spacing.md.h,

            OrderLaundryItemContent(items: state.items),
          ],
        );
      },
    );
  }
}
