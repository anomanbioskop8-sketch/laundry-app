import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/features/laundry_price/presentation/cubit/laundry_price_cubit.dart';
import 'package:app_laundry/features/laundry_price/presentation/pages/laundry_price_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryPricePageWrapper extends StatelessWidget {
  final String itemId;
  final String itemName;

  const LaundryPricePageWrapper({
    super.key,
    required this.itemId,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //BlocProvider(create: (_) => sl<LaundryItemActionCubit>()),
        BlocProvider(
          create: (_) => sl<LaundryPriceCubit>()..listenLaundryItems(itemId),
        ),
      ],
      child: LaundryPricePage(itemName: itemName),
      // child: BaseActionListener<LaundryItemActionCubit, void>(
      //   child: LaundryPricePage(price: price),
      // ),
    );
  }
}
