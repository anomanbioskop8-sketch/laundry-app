import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/base/action/base_action_listener.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/presentation/cubit/company_action_cubit.dart';
import 'package:app_laundry/features/company/presentation/pages/company_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyFormPageWrapper extends StatelessWidget {
  final CompanyEntity company;

  const CompanyFormPageWrapper({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<CompanyActionCubit>())],
      child: BaseActionListener<CompanyActionCubit, void>(
        popOnSuccess: true,
        child: CompanyFormPage(company: company),
      ),
    );
  }
}
