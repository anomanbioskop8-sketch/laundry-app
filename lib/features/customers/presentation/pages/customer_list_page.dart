import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_cubit.dart';
import 'package:flutter/material.dart';

import 'package:app_laundry/core/di/injection.dart';
import 'package:app_laundry/core/saas/state/auto_crud_cubit.dart';
import 'package:app_laundry/core/saas/engine/auto_crud_engine.dart';
import 'package:app_laundry/core/saas/ui/pages/auto_list_page.dart';

import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/usecases/delete_customer_usecase.dart';
import 'package:app_laundry/features/customers/domain/usecases/stream_customers_usecase.dart';

import 'package:app_laundry/features/customers/presentation/modules/customer_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListPage extends StatelessWidget {
  final String companyId;

  const CustomerListPage({super.key, required this.companyId});

  @override
  Widget build(BuildContext context) {
    return AutoListPage<CustomerEntity>(
      // =========================================================
      // 🔥 SAAS ENGINE (SINGLE SOURCE)
      // =========================================================
      cubit: AutoCrudCubit(AutoCrudEngine()),

      // =========================================================
      // 🔥 MODULE CONFIG (CORE V4)
      // =========================================================
      config: CustomerModule.build(
        companyId: companyId,
        streamUseCase: getIt<StreamCustomersUseCase>(),
        // =========================
        // ACTION HANDLER
        // =========================
        deleteCustomer: (id) async {
          //debugPrint("Detail: $id");
          await getIt<DeleteCustomerUseCase>()(DeleteCustomerParams(id));
        },

        onDetail: (context, customer) {
          // TODO: detail page
          debugPrint("Detail: ${customer.name}");
        },

        onEdit: (context, customer) {
          // TODO: edit page
          debugPrint("Edit: ${customer.name}");
        },
      ),
    );
  }
}
