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
import 'package:lucide_icons_flutter/lucide_icons.dart';

abstract final class AppIcons {
  AppIcons._();

  // =========================
  // FEEDBACK
  // =========================

  static const success = Icons.check_circle_rounded;
  static const info = LucideIcons.badgeInfo;
  static const warning = LucideIcons.badgeAlert;
  static const error = Icons.bug_report_rounded;

  // =========================
  // DIALOG
  // =========================
  static const confirm = LucideIcons.badgeQuestionMark;
  static const alert = LucideIcons.badgeAlert;

  // =========================
  // AUTH
  // ========================
  static const user = LucideIcons.userRound;
  static const password = LucideIcons.lockKeyhole;

  // =========================
  // STATUS
  // =========================
  static const paid = LucideIcons.badgeDollarSign;
  static const unPaid = LucideIcons.badgeX;

  // =========================
  // SERVICE TYPE
  // =========================
  static const regular = LucideIcons.turtle;
  static const express = LucideIcons.rabbit;
  static const sameDay = LucideIcons.rocket;

  // =========================
  // UNITS
  // =========================
  static const pcs = LucideIcons.layers;
  static const kg = LucideIcons.weight;

  // =========================
  // MEASUREMENT
  // =========================
  static const weight = Icons.scale_outlined;

  // =========================
  // ORDER STATUS
  // =========================
  static const received = LucideIcons.clockArrowDown;
  static const inProgress = LucideIcons.clockFading;
  static const ready = LucideIcons.clockArrowUp;
  static const pickedUp = LucideIcons.clockCheck;
  static const canceled = LucideIcons.x;

  // =========================
  // ACTION
  // =========================

  static const viewDetail = LucideIcons.fullscreen;
  static const add = LucideIcons.plus;
  static const edit = LucideIcons.pencil;
  static const delete = LucideIcons.trash2;
  static const pay = LucideIcons.handCoins;
  static const save = LucideIcons.save;
  static const search = LucideIcons.search;
  static const close = LucideIcons.circleX;
  static const logout = LucideIcons.logOut;

  // =========================
  // VIEW
  // =========================

  static const view = Icons.visibility_outlined;
  static const viewOff = Icons.visibility_off_outlined;

  // =========================
  // COMPANY
  // =========================

  static const company = LucideIcons.store;
  static const setting = Icons.settings_outlined;
  static const currency = Icons.attach_money_rounded;

  // =========================
  // CUSTOMERS
  // =========================

  static const customers = LucideIcons.users;
  static const detailCustomer = LucideIcons.contact;
  static const addCustomers = LucideIcons.userPlus;
  static const editCustomers = LucideIcons.userPen;
  static const deleteCustomers = LucideIcons.userX;
  static const searchCustomers = LucideIcons.userSearch;

  static const employee = Icons.badge_outlined;

  // =========================
  // CONTACT
  // =========================

  static const phone = LucideIcons.phone;
  static const email = LucideIcons.mail;
  static const address = LucideIcons.mapPin;

  // =========================
  // ORDER
  // =========================

  static const order = LucideIcons.shoppingBasket;
  static const laundry = Icons.local_laundry_service_outlined;
  static const money = Icons.payments_outlined;

  static const price = LucideIcons.circleDollarSign;

  // =========================
  // DATE & TIME
  // =========================

  static const schedule = Icons.schedule_outlined;
  static const createdAt = LucideIcons.calendarPlus;
  static const updatedAt = LucideIcons.calendarSync;

  // =========================
  // ITEMS
  // =========================

  static const items = LucideIcons.tags;
}
