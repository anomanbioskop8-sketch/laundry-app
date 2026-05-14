import 'package:app_laundry/core/base/form/form_builder.dart';

import 'package:app_laundry/core/constants/app_strings.dart';

import 'package:app_laundry/core/constants/order_strings.dart';

import 'package:app_laundry/core/theme/helpers/theme_ext.dart';

import 'package:app_laundry/features/order/presentation/config/order_group_form_config.dart';

import 'package:app_laundry/features/order/presentation/controllers/order_group_form_controller.dart';

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final config = OrderGroupFormConfig(controller);

    return Scaffold(
      appBar: AppBar(title: Text(OrderStrings.addGroup)),

      body: Padding(
        padding: EdgeInsets.all(context.spacing.lg),

        child: FormBuilder(
          formKey: controller.formKey,

          fields: config.fields,

          submitLabel: AppStrings.save,

          onSubmit: () {
            final group = controller.build();

            Navigator.pop(context, group);
          },
        ),
      ),
    );
  }
}
