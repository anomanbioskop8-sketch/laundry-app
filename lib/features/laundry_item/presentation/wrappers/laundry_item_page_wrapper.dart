import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/pages/laundry_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryItemPageWrapper extends StatelessWidget {
  const LaundryItemPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LaundryItemActionCubit>()),
        BlocProvider(
          create: (_) => sl<LaundryItemCubit>()..listenLaundryItems(),
        ),
      ],
      child: const BaseActionListener<LaundryItemActionCubit, void>(
        child: LaundryItemPage(),
      ),
    );
  }
}
