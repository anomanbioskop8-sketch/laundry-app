import 'package:flutter/material.dart';

extension TextStyleColorSchemeX on TextStyle {
  TextStyle onSurface(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  TextStyle onSurfaceVariant(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant);
  }

  TextStyle primary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.primary);
  }

  TextStyle secondary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.secondary);
  }

  TextStyle error(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.error);
  }

  TextStyle onPrimary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onPrimary);
  }

  TextStyle outline(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.outline);
  }
}
