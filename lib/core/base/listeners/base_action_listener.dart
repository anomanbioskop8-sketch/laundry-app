// =============================================================================
// File        : base_action_listener.dart
// Path        : lib/core/base/listeners/base_action_listener.dart
// Layer       : Core (Presentation Helper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Listener global untuk handle state dari BaseActionCubit
// - Menangani loading, success, error secara konsisten
// =============================================================================

import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/core/base/cubit/base_action_state.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseActionListener<C extends BaseActionCubit<T>, T>
    extends StatelessWidget {
  final Widget child;

  /// Behavior
  final bool popOnSuccess;
  final dynamic popResult;

  /// Callback
  final VoidCallback? onSuccess;
  final Function(T data)? onSuccessWithData;
  final VoidCallback? onError;

  const BaseActionListener({
    super.key,
    required this.child,
    this.popOnSuccess = false,
    this.popResult,
    this.onSuccess,
    this.onSuccessWithData,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, BaseActionState<T>>(
      listener: (context, state) {
        state.whenOrNull(
          loading: _onLoading,
          success: (data, message) => _onSuccess(context, data, message),
          error: (message, _) => _onError(message),
        );
      },
      child: child,
    );
  }

  // =========================
  // HANDLERS
  // =========================

  void _onLoading() {
    AppUIService.showLoading();
  }

  void _onSuccess(BuildContext context, T data, String? message) {
    AppUIService.hideLoading();

    if (message != null && message.isNotEmpty) {
      AppUIService.success(message);
    }

    /// Callback
    onSuccess?.call();
    onSuccessWithData?.call(data);

    /// Auto pop
    if (popOnSuccess && Navigator.canPop(context)) {
      Navigator.pop(context, popResult ?? data);
    }
  }

  void _onError(String message) {
    AppUIService.hideLoading();
    AppUIService.error(message);

    onError?.call();
  }
}
