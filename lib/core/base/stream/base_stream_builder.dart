// =============================================================================
// File        : base_stream_builder.dart
// Path        : lib/core/base/builders/base_stream_builder.dart
// Layer       : Core (Presentation Helper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Builder universal untuk handle BaseStreamState (loading, empty, error, loaded)
// - Menyederhanakan UI reactive berbasis Bloc/Cubit
// =============================================================================

import 'package:app_laundry/core/base/stream/base_stream_state.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/core/ui/states/app_error_widget.dart';
import 'package:app_laundry/core/ui/states/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef DataBuilder<T> = Widget Function(List<T> data);

class BaseStreamBuilder<C extends StateStreamable<BaseStreamState<T>>, T>
    extends StatelessWidget {
  final DataBuilder<T> builder;

  /// Override UI
  final Widget? loading;
  final Widget? empty;
  final Widget Function(String message)? error;

  const BaseStreamBuilder({
    super.key,
    required this.builder,
    this.loading,
    this.empty,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, BaseStreamState<T>>(
      builder: (context, state) {
        return state.when(
          loading: _buildLoading,
          empty: _buildEmpty,
          error: (msg) => _buildError(msg),
          loaded: (data) => builder(data),
        );
      },
    );
  }

  // =========================
  // STATE BUILDERS
  // =========================

  Widget _buildLoading() {
    return loading ?? const AppLoadingWidget();
  }

  Widget _buildEmpty() {
    return empty ?? const AppEmptyWidget();
  }

  Widget _buildError(String message) {
    return error?.call(message) ?? AppErrorWidget(message: message);
  }
}
