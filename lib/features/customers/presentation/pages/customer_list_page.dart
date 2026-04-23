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
// - Menghubungkan UI dengan CustomerCubit
//
// Flow:
// 1. initState → start stream customer
// 2. BlocBuilder → listen perubahan state
// 3. BasePage → handle rendering (loading, error, empty, success)
//
// Notes:
// - Search logic ditangani oleh BaseSearchCubit (clean separation)
// - UI hanya render → tidak ada business logic
// =============================================================================

import 'package:app_laundry/core/base/cubit/base_state.dart';
import 'package:app_laundry/core/base/pages/base_page.dart';
import 'package:app_laundry/core/di/injection.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_form_cubit.dart';
import 'package:app_laundry/features/customers/presentation/pages/customer_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/customer_list_view.dart';
import '../widgets/customer_search_field.dart';

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

    /// 🔹 Ambil cubit sekali (best practice)
    _cubit = context.read<CustomerCubit>();

    /// 🔹 Start streaming data customer
    _cubit.listen(widget.companyId);
  }

  // ===========================================================
  // BUILD
  // ===========================================================
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, BaseState<List<CustomerEntity>>>(
      builder: (context, state) {
        return BasePage<CustomerCubit, List<CustomerEntity>>(
          cubit: _cubit,
          state: state,

          // ===================================================
          // APP BAR
          // ===================================================
          appBar: AppBar(title: const Text('Customer')),

          // ===================================================
          // SUCCESS STATE
          // ===================================================
          onSuccess: (data) => _buildSuccess(data),

          // ===================================================
          // EMPTY STATE
          // ===================================================
          empty: _buildEmpty(),

          // ===================================================
          // FLOATING ACTION BUTTON
          // ===================================================
          floatingActionButton: FloatingActionButton(
            onPressed: _goToForm,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  // ===========================================================
  // UI BUILDERS
  // ===========================================================

  /// ✅ UI ketika data tersedia
  Widget _buildSuccess(List<CustomerEntity> data) {
    return Column(
      children: [
        /// 🔍 SEARCH FIELD
        CustomerSearchField(onChanged: _cubit.search),

        /// 📋 LIST DATA
        Expanded(child: CustomerListView(data: data)),
      ],
    );
  }

  /// 📭 UI ketika data kosong
  Widget _buildEmpty() {
    return Column(
      children: [
        CustomerSearchField(onChanged: _cubit.search),
        const Expanded(child: Center(child: Text('Belum ada customer'))),
      ],
    );
  }

  // ===========================================================
  // NAVIGATION
  // ===========================================================

  /// ➕ Navigasi ke halaman form customer
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
