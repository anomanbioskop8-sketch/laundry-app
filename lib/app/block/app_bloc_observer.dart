import 'package:app_laundry/core/base/cubit/base_action_state.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    final state = change.nextState;

    debugPrint('[${bloc.runtimeType}] → $state');

    /// =========================
    /// ACTION (CRUD, dll)
    /// =========================
    if (state is BaseActionState) {
      state.when(
        initial: () {},

        loading: () {
          AppUIService.showLoading();
        },

        success: (data) {
          AppUIService.hideLoading();
          // ❌ jangan hardcode message di sini
        },

        error: (message, _) {
          AppUIService.hideLoading();
          AppUIService.error(message);
        },
      );
    }

    /// =========================
    /// AUTH (LOGIN FLOW)
    /// =========================
    if (state is AuthState) {
      state.when(
        initial: () {},

        loading: () {
          AppUIService.showLoading();
        },

        authenticated: (_) {
          AppUIService.hideLoading();
        },

        unauthenticated: () {
          AppUIService.hideLoading();
        },

        error: (message) {
          AppUIService.hideLoading();
          AppUIService.error(message);
        },
      );
    }
  }
}
