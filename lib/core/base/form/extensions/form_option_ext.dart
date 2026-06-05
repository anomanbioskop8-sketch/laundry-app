// lib/core/base/form/extensions/form_option_ext.dart

import 'package:app_laundry/core/base/form/fields/form_option.dart';

extension EnumFormOptionExtension<T> on Iterable<T> {
  List<FormOption> toFormOptions({
    required String Function(T e) value,
    required String Function(T e) label,
    required dynamic Function(T e) icon,
  }) {
    return map(
      (e) => FormOption(value: value(e), label: label(e), icon: icon(e)),
    ).toList();
  }
}
