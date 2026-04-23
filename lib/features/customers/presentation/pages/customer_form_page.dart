import 'package:app_laundry/features/customers/presentation/widgets/customer_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../cubit/customer_form_cubit.dart';

class CustomerFormPage extends StatelessWidget {
  final String companyId;

  const CustomerFormPage({super.key, required this.companyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CustomerFormCubit>()..setField('companyId', companyId),
      child: const CustomerFormView(),
    );
  }
}
