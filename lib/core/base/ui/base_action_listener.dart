// core/base/ui/base_action_listener.dart
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/services/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/base_action_cubit.dart';
import '../cubit/base_action_state.dart';

class BaseActionListener<C extends BaseActionCubit<T>, T>
    extends StatelessWidget {
  final Widget child;

  const BaseActionListener({super.key, required this.child});

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
