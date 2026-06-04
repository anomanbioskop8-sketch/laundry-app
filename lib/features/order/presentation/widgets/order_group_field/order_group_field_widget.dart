import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_state.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_add_button.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field/order_group_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderGroupFieldWidget extends StatelessWidget {
  const OrderGroupFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderFormCubit, OrderFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderGroupAddButton(),
            context.spacing.md.h,
            OrderGroupContent(groups: state.groups),
          ],
        );
      },
    );
  }
}
