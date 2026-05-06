// =============================================================================
// File        : bool_controller.dart
// Path        : lib/core/base/form/controllers/bool_controller.dart
// Layer       : Presentation (Form Controller)
// -----------------------------------------------------------------------------

import 'package:flutter/foundation.dart';

class BoolController extends ValueNotifier<bool> {
  BoolController([super.value = false]);

  bool get valueOrFalse => value;

  void setValue(bool newValue) {
    value = newValue;
  }

  void toggle() {
    value = !value;
  }
}
