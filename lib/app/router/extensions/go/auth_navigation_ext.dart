import 'package:app_laundry/app/router/paths/auth_paths.dart';
import 'package:app_laundry/app/router/paths/main_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension AuthNavigationExt on BuildContext {
  void goLogin() {
    go(AuthPaths.loginPath);
  }

  void goRegister() {
    go(AuthPaths.registerPath);
  }

  void goMain() {
    go(MainPaths.mainPath);
  }
}
