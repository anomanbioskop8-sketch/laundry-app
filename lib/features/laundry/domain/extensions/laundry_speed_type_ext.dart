// =============================================================================
// File : laundry_speed_type_ext.dart
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/form/fields/form_option.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';
import 'package:flutter/material.dart';

extension LaundrySpeedTypeExt on LaundrySpeedType {
  // =========================
  // VALUE
  // =========================

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

  // =========================
  // LABEL
  // =========================

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
  // HELPERS
  // =========================

  bool get isRegular => this == LaundrySpeedType.regular;

  bool get isExpress => this == LaundrySpeedType.express;

  bool get isSameDay => this == LaundrySpeedType.sameDay;

  // =========================
  // PRICE
  // =========================

  int priceFrom(SettingEntity setting) {
    switch (this) {
      case LaundrySpeedType.regular:
        return setting.regularPrice;

      case LaundrySpeedType.express:
        return setting.expressPrice;

      case LaundrySpeedType.sameDay:
        return setting.sameDayPrice;
    }
  }

  // =========================
  // ESTIMATION
  // =========================

  Duration estimationFrom(SettingEntity setting) {
    switch (this) {
      case LaundrySpeedType.regular:
        return Duration(days: setting.regularEstimation);

      case LaundrySpeedType.express:
        return Duration(days: setting.expressEstimation);

      case LaundrySpeedType.sameDay:
        return Duration(days: setting.sameDayEstimation);
    }
  }

  // =========================
  // FORM OPTION
  // =========================

  FormOption get option {
    return FormOption(value: value, label: label, icon: icon);
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
  // STATIC HELPERS
  // =========================

  static List<FormOption> get options {
    return LaundrySpeedType.values.map((e) => e.option).toList();
  }

  static List<String> get labels {
    return LaundrySpeedType.values.map((e) => e.label).toList();
  }
}
