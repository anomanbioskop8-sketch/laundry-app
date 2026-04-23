// =============================================================================
// File        : customer_list_page.dart
// Path        : features/customers/presentation/pages/customer_list_page.dart
// Layer       : Presentation (UI - Page)
// -----------------------------------------------------------------------------
// CustomerListPage
//
// Responsibility:
// - Menampilkan daftar customer berdasarkan companyId
// - Meng-handle input pencarian (search)
// - Navigasi ke halaman form (create customer)
//
// Notes:
// - State & Action handling FULLY delegated to BasePage
// - Tidak ada BlocBuilder / BlocListener manual
// - UI hanya fokus ke rendering
// =============================================================================

import 'package:app_laundry/core/base/pages/base_page.dart';
import 'package:app_laundry/core/di/injection.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_form_cubit.dart';
import 'package:app_laundry/features/customers/presentation/pages/customer_form_page.dart';
import 'package:app_laundry/features/customers/presentation/widgets/customer_empty_content.dart';
import 'package:app_laundry/features/customers/presentation/widgets/customer_list_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerListPage extends StatefulWidget {
  final String companyId;

  const CustomerListPage({super.key, required this.companyId});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  late final CustomerCubit _cubit;

  // ===========================================================
  // LIFECYCLE
  // ===========================================================
  @override
  void initState() {
    super.initState();

    _cubit = context.read<CustomerCubit>();

    /// 🔥 Start stream (ONLY ONCE)
    _cubit.listen(widget.companyId);
  }

  // ===========================================================
  // BUILD
  // ===========================================================
  @override
  Widget build(BuildContext context) {
    return BasePage<CustomerCubit, List<CustomerEntity>, CustomerActionCubit>(
      // =======================================================
      // APP BAR
      // =======================================================
      appBar: AppBar(title: const Text('Customer')),

      // =======================================================
      // SUCCESS UI
      // =======================================================
      onSuccess: (context, data) =>
          CustomerListContent(data: data, onSearch: _cubit.search),

      // =======================================================
      // EMPTY UI
      // =======================================================
      empty: CustomerEmptyContent(onSearch: _cubit.search),

      // =======================================================
      // FAB
      // =======================================================
      floatingActionButton: FloatingActionButton(
        onPressed: _goToForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ===========================================================
  // NAVIGATION
  // ===========================================================

  void _goToForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<CustomerFormCubit>(),
          child: CustomerFormPage(companyId: widget.companyId),
        ),
      ),
    );
  }
}
