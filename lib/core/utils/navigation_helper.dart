import 'package:flutter/material.dart';

class NavigationHelper {
  static void toHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/customers', (route) => false);
  }

  static void toLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  static void toRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }
}
