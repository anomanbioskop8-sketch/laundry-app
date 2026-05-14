import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/constants/app_strings.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/config/customer_form_config.dart';
import 'package:app_laundry/features/customer/presentation/controllers/customer_form_controller.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerFormPage extends StatefulWidget {
  final CustomerEntity? customer;

  const CustomerFormPage({super.key, this.customer});

  @override
  State<CustomerFormPage> createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends State<CustomerFormPage> {
  final controller = CustomerFormController();

  @override
  void initState() {
    super.initState();

    if (widget.customer != null) {
      controller.setData(widget.customer!);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomerActionCubit>();
    final config = CustomerFormConfig(controller);

    return Scaffold(
      appBar: AppBar(title: Text(config.submitLabel)),
      body: FormBuilder(
        formKey: controller.formKey,
        fields: config.fields,
        submitLabel: AppStrings.save,
        onSubmit: () {
          cubit.submit(controller.buildParams());
        },
      ),
    );
  }
}
