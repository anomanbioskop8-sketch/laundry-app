// =============================================================================
// File        : base_page.dart
// Path        : core/base/pages/base_page.dart
// Layer       : Presentation (UI - Base Page)
// -----------------------------------------------------------------------------
// BasePage<C, T, AC>
//
// Responsibility:
// - Combine:
//   1. BlocBuilder  → render UI state
//   2. BlocListener → handle action (snackbar, loading, dll)
//   3. Scaffold     → layout utama
//
// Generic:
// - C  = Cubit untuk state (BaseCubit)
// - T  = Data type
// - AC = Action Cubit (BaseActionCubit)
//
// Benefits:
// - Zero boilerplate UI
// - Centralized UI behavior
// - Clean Architecture compliant
// =============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/base_state.dart';
import '../action/base_action_state.dart';
import '../../services/app_ui_service.dart';
import '../widgets/base_builder.dart';

class BasePage<
  C extends Cubit<BaseState<T>>,
  T,
  AC extends Cubit<BaseActionState>
>
    extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  /// =========================
  /// STATE BUILDER
  /// =========================
  final Widget Function(BuildContext context, T data) onSuccess;

  final Widget? loading;
  final Widget Function(String message)? onError;
  final Widget? empty;

  /// =========================
  /// OPTIONAL CUSTOM LISTENER
  /// =========================
  final void Function(BuildContext context, BaseActionState state)?
  actionListener;

  const BasePage({
    super.key,
    this.appBar,
    this.floatingActionButton,
    required this.onSuccess,
    this.loading,
    this.onError,
    this.empty,
    this.actionListener,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AC, BaseActionState>(
      listener: (context, actionState) {
        // ===========================================================
        // DEFAULT HANDLER (AUTO UI)
        // ===========================================================
        if (actionState is ActionLoading) {
          AppUIService.showLoading();
        }

        if (actionState is ActionError) {
          AppUIService.hideLoading();
          AppUIService.error(actionState.message);
        }

        if (actionState is ActionSuccess) {
          AppUIService.hideLoading();
          AppUIService.success(actionState.message);
        }

        // ===========================================================
        // CUSTOM LISTENER (OPTIONAL OVERRIDE)
        // ===========================================================
        actionListener?.call(context, actionState);
      },

      child: BlocBuilder<C, BaseState<T>>(
        builder: (context, state) {
          return Scaffold(
            appBar: appBar,
            floatingActionButton: floatingActionButton,

            body: BaseBuilder<T>(
              state: state,
              onSuccess: (data) => onSuccess(context, data),
              loading: loading,
              onError: onError,
              empty: empty,
            ),
          );
        },
      ),
    );
  }
}
