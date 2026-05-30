// =============================================================================
// File : register_core.dart
// =============================================================================

import 'package:app_laundry/app/di/auth/register_customer_policy.dart';
import 'package:app_laundry/app/di/auth/register_order_policy.dart';
import 'package:app_laundry/app/di/auth/register_permission.dart';
import 'package:app_laundry/app/di/core/register_firebase.dart';
import 'package:app_laundry/app/di/core/register_logger.dart';
import 'package:app_laundry/app/di/core/register_session.dart';
import 'package:get_it/get_it.dart';

Future<void> registerCore(GetIt sl) async {
  // =========================
  // CORE
  // =========================

  registerLogger(sl);
  registerFirebase(sl);
  registerSession(sl);
  //registerNavigation(sl);

  // =========================
  // POLICY
  // =========================

  registerCustomerPolicy(sl);
  registerOrderPolicy(sl);
  registerPermission(sl);
}
