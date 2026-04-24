import 'package:app_laundry/core/saas/config/action_config.dart';
import 'package:app_laundry/core/saas/config/field_config.dart';
import 'package:app_laundry/core/saas/config/permission_config.dart';
import 'package:flutter/material.dart';

class ModuleConfig<T> {
  final String name;

  /// DATA
  final Stream<List<T>> Function() stream;

  /// FIELD DEFINITIONS (🔥 CORE V4)
  final List<FieldConfig> fields;

  /// ACTIONS
  final List<ActionConfig<T>> actions;

  /// PERMISSION
  final PermissionConfig? permission;

  final Widget Function(BuildContext context, T item) itemBuilder;

  const ModuleConfig({
    required this.name,
    required this.stream,
    required this.fields,
    required this.actions,
    required this.itemBuilder,
    this.permission,
  });
}
