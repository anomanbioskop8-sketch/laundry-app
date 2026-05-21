// =============================================================================
// File        : app_icons.dart
// Path        : lib/core/constants/app_icons.dart
// Layer       : Core
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyimpan semua icon aplikasi
// - Centralized icon management
// =============================================================================

import 'package:flutter/material.dart';

abstract final class AppIcons {
  // =========================
  // VIEW
  // =========================

  static const view = Icons.info_outline;

  static const viewOff = Icons.visibility_off_outlined;

  // =========================
  // GENERAL
  // =========================

  static const add = Icons.add_rounded;

  static const edit = Icons.edit_rounded;

  static const delete = Icons.delete_rounded;

  static const search = Icons.search_rounded;

  static const save = Icons.save_rounded;

  static const close = Icons.close_rounded;

  static const info = Icons.info_outline_rounded;

  // =========================
  // COMPANY
  // =========================

  static const company = Icons.business_outlined;

  static const address = Icons.location_on_outlined;

  static const phone = Icons.phone_outlined;

  static const email = Icons.email_outlined;

  static const currency = Icons.attach_money_rounded;

  // =========================
  // CUSTOMER
  // =========================

  static const customer = Icons.person_outline_rounded;

  // =========================
  // EMPLOYEE
  // =========================

  static const employee = Icons.badge_outlined;

  // =========================
  // ORDER
  // =========================

  static const order = Icons.receipt_long_outlined;

  static const laundry = Icons.local_laundry_service_outlined;

  // =========================
  // DATE
  // =========================

  static const createdAt = Icons.calendar_today_outlined;

  static const updatedAt = Icons.update_rounded;
}
