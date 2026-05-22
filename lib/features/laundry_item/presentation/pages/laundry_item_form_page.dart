import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/constants/strings/app_strings.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/presentation/config/laundry_item_form_config.dart';
import 'package:app_laundry/features/laundry_item/presentation/controllers/laundry_item_form_controller.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryItemFormPage extends StatefulWidget {
  final LaundryItemEntity? item;

  const LaundryItemFormPage({super.key, this.item});

  @override
  State<LaundryItemFormPage> createState() => _LaundryItemFormPageState();
}

class _LaundryItemFormPageState extends State<LaundryItemFormPage> {
  final controller = LaundryItemFormController();

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      controller.setData(widget.item!);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LaundryItemActionCubit>();
    final config = LaundryItemFormConfig(controller);

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
