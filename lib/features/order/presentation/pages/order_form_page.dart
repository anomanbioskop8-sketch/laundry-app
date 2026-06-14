import 'package:app_laundry/app/router/extensions/push/order_navigation_ext.dart';
import 'package:app_laundry/core/base/stream/base_stream_builder.dart';
import 'package:app_laundry/core/form/builders/form_builder.dart';
import 'package:app_laundry/core/constants/strings/app_strings.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/form/helpers/form_submit_helper.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/core/ui/widgets/buttons/app_elevated_action_button.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/order/presentation/config/order_form_config.dart';
import 'package:app_laundry/features/order/presentation/controllers/order_form_controller.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderFormPage extends StatefulWidget {
  const OrderFormPage({super.key});

  @override
  State<OrderFormPage> createState() => OrderFormPageState();
}

class OrderFormPageState extends State<OrderFormPage> {
  late final OrderFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OrderFormController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final orderFormCubit = context.read<OrderFormCubit>();

    final params = orderFormCubit.buildParams(
      paymentStatus: _controller.selectedPaymentStatus,
    );

    await context.pushConfirmationOrder(order: params);
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<CustomerCubit, CustomerEntity>(
      builder: (customers) {
        final config = OrderFormConfig(
          controller: _controller,
          customers: customers,
        );

        return Scaffold(
          appBar: AppBar(title: const Text(OrderStrings.create)),

          body: FormBuilder(
            formKey: _controller.formKey,
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
                    formKey: _controller.formKey,
                    fields: config.fields,
                    onSubmit: _submit,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
