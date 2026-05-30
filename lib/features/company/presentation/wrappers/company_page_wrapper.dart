import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/features/company/presentation/cubit/company_cubit.dart';
import 'package:app_laundry/features/company/presentation/pages/company_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyPageWrapper extends StatelessWidget {
  const CompanyPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //BlocProvider(create: (_) => sl<LaundryItemActionCubit>()),
        BlocProvider(create: (_) => sl<CompanyCubit>()),
      ],
      child: CompanyPage(),
      // child: const BaseActionListener<LaundryItemActionCubit, void>(
      //   child: LaundryItemPage(),
      // ),
    );
  }
}
