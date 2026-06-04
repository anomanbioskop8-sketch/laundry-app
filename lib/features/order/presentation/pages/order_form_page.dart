import 'package:app_laundry/app/router/extensions/push/order_navigation_ext.dart';
import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/constants/strings/app_strings.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
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
  final controller = OrderFormController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(OrderStrings.create)),
      body: BaseStreamBuilder<CustomerCubit, CustomerEntity>(
        builder: (customers) {
          final config = OrderFormConfig(
            controller: controller,
            customers: customers,
          );
          return FormBuilder(
            formKey: controller.formKey,
            fields: config.fields,
            submitLabel: AppStrings.save,
            onSubmit: () {
              final params = context.read<OrderFormCubit>().buildParams(
                paymentStatus: controller.selectedPaymentStatus,
              );

              context.pushConfirmationOrder(order: params);
              context.pushConfirmationOrder(order: params);
            },
          );
        },
      ),
    );
  }
}
