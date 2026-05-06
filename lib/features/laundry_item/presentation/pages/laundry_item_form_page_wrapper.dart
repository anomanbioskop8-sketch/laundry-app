import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/pages/laundry_item_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryItemFormPageWrapper extends StatelessWidget {
  final LaundryItemEntity? item;

  const LaundryItemFormPageWrapper({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<LaundryItemActionCubit>())],
      child: BaseActionListener<LaundryItemActionCubit, void>(
        popOnSuccess: true,
        child: LaundryItemFormPage(item: item),
      ),
    );
  }
}
