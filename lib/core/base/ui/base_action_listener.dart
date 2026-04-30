// core/base/ui/base_action_listener.dart
import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/core/base/cubit/base_action_state.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/services/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseActionListener<C extends BaseActionCubit<T>, T>
    extends StatelessWidget {
  final Widget child;

  /// 🔥 NEW
  final bool popOnSuccess;
  final dynamic popResult;
  final VoidCallback? onSuccess;

  const BaseActionListener({
    super.key,
    required this.child,
    this.popOnSuccess = false,
    this.popResult,
    this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, BaseActionState<T>>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            AppUIService.showLoading();
          },

          success: (data, message) {
            AppUIService.hideLoading();

            if (message != null) {
              AppSnackbar1.success(context, message);
            }

            /// 🔥 CALLBACK
            onSuccess?.call();

            /// 🔥 AUTO POP
            if (popOnSuccess) {
              Navigator.pop(context, popResult ?? true);
            }
          },

          error: (message, _) {
            AppUIService.hideLoading();
            AppSnackbar1.error(context, message);
          },
        );
      },
      child: child,
    );
  }
}
