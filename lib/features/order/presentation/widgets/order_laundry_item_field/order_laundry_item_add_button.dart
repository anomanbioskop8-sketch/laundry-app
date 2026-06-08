import 'package:app_laundry/app/router/extensions/push/order_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_outlined_action_button.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderLaundryItemAddButton extends StatelessWidget {
  final StreamOrderLaundryItemsParams params;

  const OrderLaundryItemAddButton({super.key, required this.params});

  Future<void> _addItem(BuildContext context) async {
    final result = await context.pushOrderLaundryItemForm(params: params);

    if (result is! List<OrderLaundryItemEntity> || !context.mounted) {
      return;
    }

    context.read<OrderGroupFormCubit>().addItems(result);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppOutlinedActionButton(
        icon: AppIcons.add,
        label: OrderStrings.addItem,
        onPressed: () => _addItem(context),
      ),
    );
  }
}
