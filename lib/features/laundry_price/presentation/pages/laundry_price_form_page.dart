import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/constants/strings/app_strings.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/presentation/config/laundry_price_form_config.dart';
import 'package:app_laundry/features/laundry_price/presentation/controllers/laundry_price_form_controller.dart';
import 'package:app_laundry/features/laundry_price/presentation/cubit/laundry_price_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryPriceFormPage extends StatefulWidget {
  final LaundryPriceEntity? price;

  const LaundryPriceFormPage({super.key, this.price});

  @override
  State<LaundryPriceFormPage> createState() => _LaundryPriceFormPageState();
}

class _LaundryPriceFormPageState extends State<LaundryPriceFormPage> {
  final controller = LaundryPriceFormController();

  @override
  void initState() {
    super.initState();

    if (widget.price != null) {
      controller.setData(widget.price!);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LaundryPriceActionCubit>();
    final config = LaundryPriceFormConfig(controller);

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
