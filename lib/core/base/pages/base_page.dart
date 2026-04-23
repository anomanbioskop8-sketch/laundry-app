// =============================================================================
// File        : base_page.dart
// Path        : core/base/widgets/base_page.dart
// Layer       : Presentation (UI - Page Wrapper)
// -----------------------------------------------------------------------------
// BasePage<C, T>
//
// Responsibility:
// - Wrapper halaman standar berbasis Scaffold.
// - Mengintegrasikan BaseBuilder untuk handling state UI.
// - Menyederhanakan struktur halaman (reduce boilerplate).
//
// Supported State (via BaseBuilder):
// - BaseLoading  → tampilkan loading widget
// - BaseError    → tampilkan error widget / message
// - BaseEmpty    → tampilkan empty state
// - BaseSuccess  → render data via onSuccess
//
// Usage:
// BlocBuilder<CustomerCubit, BaseState<List<CustomerEntity>>>(
//   builder: (context, state) {
//     return BasePage<CustomerCubit, List<CustomerEntity>>(
//       cubit: context.read<CustomerCubit>(),
//       state: state,
//       appBar: AppBar(title: Text('Customer')),
//       onSuccess: (data) => CustomerListView(data: data),
//     );
//   },
// )
//
// Notes:
// - Tidak meng-handle BlocBuilder → fleksibel digunakan di mana saja.
// - Cocok untuk semua halaman berbasis state (list/detail).
// - Fokus hanya pada UI layer (tidak ada logic bisnis).
// =============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/base_state.dart';
import '../widgets/base_builder.dart';

class BasePage<C extends Cubit<BaseState<T>>, T> extends StatelessWidget {
  /// 🔹 Instance Cubit (optional, untuk extensibility / debugging)
  final C cubit;

  /// 🔄 State dari Cubit
  final BaseState<T> state;

  /// ✅ Builder utama saat data berhasil
  final Widget Function(T data) onSuccess;

  /// 🧭 AppBar halaman (optional)
  final PreferredSizeWidget? appBar;

  /// ➕ Floating Action Button (optional)
  final Widget? floatingActionButton;

  /// ⏳ Custom loading widget (optional)
  final Widget? loading;

  /// ❌ Custom error builder (optional)
  final Widget Function(String message)? onError;

  /// 📭 Custom empty widget (optional)
  final Widget? empty;

  const BasePage({
    super.key,
    required this.cubit,
    required this.state,
    required this.onSuccess,
    this.appBar,
    this.floatingActionButton,
    this.loading,
    this.onError,
    this.empty,
  });

  @override
  Widget build(BuildContext context) {
    // ===========================================================
    // BODY (STATE HANDLER)
    // ===========================================================
    final Widget body = BaseBuilder<T>(
      state: state,
      onSuccess: onSuccess,
      loading: loading,
      onError: onError,
      empty: empty,
    );

    // ===========================================================
    // MAIN SCAFFOLD
    // ===========================================================
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
