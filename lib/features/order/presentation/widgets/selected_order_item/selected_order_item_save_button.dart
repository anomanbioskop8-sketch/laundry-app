import 'package:app_laundry/core/theme/extensions/theme_spacing_ext.dart';
import 'package:app_laundry/core/ui/components/app_elevated_action_button.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedOrderItemSaveButton extends StatelessWidget {
  const SelectedOrderItemSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderItemSelectionCubit, OrderItemSelectionState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.all(context.spacing.lg),
            child: SizedBox(
              width: double.infinity,
              child: AppElevatedActionButton(
                label: 'Simpan (${state.selectedCount})',
                onPressed: state.canSave
                    ? () {
                        Navigator.pop(context, state.selectedItems);
                      }
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
