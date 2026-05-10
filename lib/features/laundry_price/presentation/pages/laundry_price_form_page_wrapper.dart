import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/presentation/cubit/laundry_price_action_cubit.dart';
import 'package:app_laundry/features/laundry_price/presentation/pages/laundry_price_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryPriceFormPageWrapper extends StatelessWidget {
  final LaundryPriceEntity? price;

  const LaundryPriceFormPageWrapper({super.key, this.price});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<LaundryPriceActionCubit>())],
      child: BaseActionListener<LaundryPriceActionCubit, void>(
        popOnSuccess: true,
        child: LaundryPriceFormPage(price: price),
      ),
    );
  }
}
