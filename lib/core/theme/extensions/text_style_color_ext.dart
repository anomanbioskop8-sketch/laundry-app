import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:flutter/material.dart';

extension TextStyleColorExt on TextStyle {
  TextStyle onSurface(BuildContext context) {
    return copyWith(color: context.colors.onSurface);
  }

  TextStyle onSurfaceVariant(BuildContext context) {
    return copyWith(color: context.colors.onSurfaceVariant);
  }

  TextStyle primary(BuildContext context) {
    return copyWith(color: context.colors.primary);
  }

  TextStyle warning(BuildContext context) {
    return copyWith(color: context.status.warning);
  }

  TextStyle error(BuildContext context) {
    return copyWith(color: context.colors.error);
  }

  TextStyle onPrimary(BuildContext context) {
    return copyWith(color: context.colors.onPrimary);
  }

  TextStyle outline(BuildContext context) {
    return copyWith(color: context.colors.outline);
  }
}
