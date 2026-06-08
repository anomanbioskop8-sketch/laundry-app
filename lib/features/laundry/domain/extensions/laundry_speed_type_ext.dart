// features/laundry_price/domain/enums/laundry_service_type_ext.dart

import 'package:app_laundry/core/form/fields/form_option.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:flutter/material.dart';

extension LaundrySpeedTypeExt on LaundrySpeedType {
  String get value {
    switch (this) {
      case LaundrySpeedType.regular:
        return 'regular';

      case LaundrySpeedType.express:
        return 'express';

      case LaundrySpeedType.sameDay:
        return 'same_day';
    }
  }

  String get label {
    switch (this) {
      case LaundrySpeedType.regular:
        return 'Regular';

      case LaundrySpeedType.express:
        return 'Express';

      case LaundrySpeedType.sameDay:
        return 'Same Day';
    }
  }

  // =========================
  // ICON
  // =========================

  IconData get icon {
    switch (this) {
      case LaundrySpeedType.regular:
        return AppIcons.regular;

      case LaundrySpeedType.express:
        return AppIcons.express;

      case LaundrySpeedType.sameDay:
        return AppIcons.sameDay;
    }
  }

  // =========================
  // COLOR
  // =========================

  Color color(BuildContext context) {
    switch (this) {
      case LaundrySpeedType.regular:
        return context.status.info;

      case LaundrySpeedType.express:
        return context.status.warning;

      case LaundrySpeedType.sameDay:
        return context.status.success;
    }
  }

  // =========================
  // ESTIMATION
  // =========================

  int get estimationHours {
    switch (this) {
      case LaundrySpeedType.regular:
        return 48;

      case LaundrySpeedType.express:
        return 24;

      case LaundrySpeedType.sameDay:
        return 6;
    }
  }

  // =========================
  // FROM STRING
  // =========================

  static LaundrySpeedType fromString(String value) {
    switch (value) {
      case 'express':
        return LaundrySpeedType.express;

      case 'same_day':
        return LaundrySpeedType.sameDay;

      default:
        return LaundrySpeedType.regular;
    }
  }

  // =========================
  // FORM OPTION
  // =========================

  FormOption get option {
    return FormOption(value: value, label: label, icon: icon);
  }

  // =========================
  // FORM OPTIONS
  // =========================

  static List<FormOption> get options {
    return LaundrySpeedType.values.map((e) => e.option).toList();
  }
}
