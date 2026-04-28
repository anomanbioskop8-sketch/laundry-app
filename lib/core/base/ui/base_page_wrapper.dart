// core/base/ui/base_page_wrapper.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_action_listener.dart';
import '../cubit/base_action_cubit.dart';

class BasePageWrapper<C extends BaseActionCubit<T>, T> extends StatelessWidget {
  final Widget child;

  const BasePageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BaseActionListener<C, T>(child: child);
  }
}
