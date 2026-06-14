// =============================================================================
// File        : order_group_form_page.dart
// =============================================================================

import 'package:app_laundry/core/constants/strings/app_strings.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/form/builders/form_builder.dart';
import 'package:app_laundry/core/form/helpers/form_submit_helper.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_elevated_action_button.dart';
import 'package:app_laundry/features/order/presentation/config/order_group_form_config.dart';
import 'package:app_laundry/features/order/presentation/controllers/order_group_form_controller.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_group_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderGroupFormPage extends StatefulWidget {
  const OrderGroupFormPage({super.key});

  @override
  State<OrderGroupFormPage> createState() => OrderGroupFormPageState();
}

class OrderGroupFormPageState extends State<OrderGroupFormPage> {
  final controller = OrderGroupFormController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final group = await context.read<OrderGroupFormCubit>().build(
      serviceType: controller.selectedServiceType,
      speedType: controller.selectedSpeedType,
      orderType: controller.selectedOrderType,
      weight: controller.weightValue,
    );

    if (!mounted) return;

    Navigator.pop(context, group);
  }

  @override
  Widget build(BuildContext context) {
    final config = OrderGroupFormConfig(
      controller: controller,
      onLaundryTypeChanged: () {
        context.read<OrderGroupFormCubit>().clearItems();
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text(OrderStrings.addGroup)),

      body: FormBuilder(
        formKey: controller.formKey,
        fields: config.fields,
        onSubmit: _submit,
        showSubmitButton: false,
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.spacing.md),
          child: AppElevatedActionButton(
            label: AppStrings.save,
            onPressed: () {
              FormSubmitHelper.submit(
                formKey: controller.formKey,
                fields: config.fields,
                onSubmit: _submit,
              );
            },
          ),
        ),
      ),
    );
  }
}
