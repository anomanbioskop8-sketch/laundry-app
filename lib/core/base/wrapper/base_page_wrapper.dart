// =============================================================================
// File        : base_page_wrapper.dart
// Path        : lib/core/base/wrappers/base_page_wrapper.dart
// Layer       : Core (Presentation Helper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Wrapper standar untuk page yang menggunakan BaseActionCubit
// - Meng-handle action listener secara global (loading, success, error)
// - Menyediakan hook untuk custom behavior per page
// =============================================================================

import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/core/base/listeners/base_action_listener.dart';
import 'package:flutter/material.dart';

class BasePageWrapper<C extends BaseActionCubit<T>, T> extends StatelessWidget {
  final Widget child;

  /// Behavior
  final bool popOnSuccess;
  final dynamic popResult;

  /// Callback
  final VoidCallback? onSuccess;
  final Function(T data)? onSuccessWithData;
  final VoidCallback? onError;

  const BasePageWrapper({
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
    return BaseActionListener<C, T>(
      popOnSuccess: popOnSuccess,
      popResult: popResult,
      onSuccess: onSuccess,
      onSuccessWithData: onSuccessWithData,
      onError: onError,
      child: child,
    );
  }
}
