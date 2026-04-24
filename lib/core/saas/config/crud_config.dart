import 'package:app_laundry/core/saas/models/crud_action.dart';
import 'package:flutter/material.dart';

class CrudConfig<T> {
  final String title;

  final Stream<List<T>> Function() stream;

  final Widget Function(T item) itemBuilder;

  final String Function(T item) label;

  final bool Function(T item, String keyword) filter;

  final List<T> Function(List<T>)? sort;

  final List<CrudAction<T>> Function(BuildContext context, T item) actions;

  /// 🔥 NEW V3 FEATURES
  final Future<T> Function(T item)? onCreate;
  final Future<T> Function(T item)? onUpdate;
  final Future<void> Function(T item)? onDelete;

  const CrudConfig({
    required this.title,
    required this.stream,
    required this.itemBuilder,
    required this.label,
    required this.filter,
    required this.actions,
    this.sort,
    this.onCreate,
    this.onUpdate,
    this.onDelete,
  });
}
