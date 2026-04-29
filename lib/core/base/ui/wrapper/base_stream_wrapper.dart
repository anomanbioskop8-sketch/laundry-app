import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/base_stream_state.dart';
import '../states/app_loading_widget.dart';
import '../states/app_empty_widget.dart';
import '../states/app_error_widget.dart';

typedef LoadedBuilder<T> = Widget Function(List<T> data);

class BaseStreamWrapper<C extends StateStreamable<BaseStreamState<T>>, T>
    extends StatelessWidget {
  final LoadedBuilder<T> builder;

  final Widget? loading;
  final Widget? empty;
  final Widget Function(String message)? error;

  const BaseStreamWrapper({
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
          loading: () => loading ?? const AppLoadingWidget(),
          empty: () => empty ?? const AppEmptyWidget(),
          error: (msg) => error?.call(msg) ?? AppErrorWidget(message: msg),
          loaded: (data) => builder(data),
        );
      },
    );
  }
}
