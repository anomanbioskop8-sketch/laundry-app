// =============================================================================
// File        : navigation_service.dart
// Path        : core/navigation/navigation_service.dart
// Layer       : Core (Navigation)
// -----------------------------------------------------------------------------
// Fungsi:
// - Wrapper GoRouter untuk navigation di luar UI (Cubit / Service layer)
// - Menghindari penggunaan context di business logic
// - Menyediakan API navigasi yang konsisten
//
// Features:
// - go (replace stack)
// - push (add to stack)
// - pop
// - safe navigation (canPop check)
// =============================================================================

import 'package:go_router/go_router.dart';
import 'route_paths.dart';

class NavigationService {
  NavigationService(this._router);

  final GoRouter _router;

  // =========================================================
  // BASIC NAVIGATION
  // =========================================================

  void goNamed(String routeName, {Object? extra}) {
    _router.goNamed(routeName, extra: extra);
  }

  void pushNamed(String routeName, {Object? extra}) {
    _router.pushNamed(routeName, extra: extra);
  }

  void replaceNamed(String routeName, {Object? extra}) {
    _router.pushReplacementNamed(routeName, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    if (_router.canPop()) {
      _router.pop(result);
    }
  }

  // =========================================================
  // AUTH FLOW
  // =========================================================

  void toLogin() {
    goNamed(AuthPaths.loginName);
  }

  void toRegister() {
    pushNamed(AuthPaths.registerName);
  }

  void toHome() {
    goNamed(MainPaths.mainName);
  }

  void toSplash() {
    goNamed(AuthPaths.splashName);
  }

  // =========================================================
  // CUSTOMER FLOW
  // =========================================================

  void toCustomers({bool isPicker = false}) {
    pushNamed(CustomerPaths.customersName, extra: isPicker);
  }

  void toCustomerForm(Object? args) {
    pushNamed(CustomerPaths.customerFormName, extra: args);
  }

  void toCustomerDetail(Object args) {
    pushNamed(CustomerPaths.customerDetailName, extra: args);
  }

  // =========================================================
  // ORDER FLOW
  // =========================================================

  void toOrderForm(Object? args) {
    pushNamed(OrderPaths.orderFormName, extra: args);
  }

  void toOrderGroupForm() {
    pushNamed(OrderPaths.orderGroupFormName);
  }

  // =========================================================
  // LAUNDRY ITEM
  // =========================================================

  void toLaundryItemForm(Object? args) {
    pushNamed(LaundryItemPaths.laundryItemFormName, extra: args);
  }

  // =========================================================
  // LAUNDRY PRICE
  // =========================================================

  void toLaundryPrice(Object args) {
    pushNamed(LaundryPricePaths.laundryPriceName, extra: args);
  }

  void toLaundryPriceForm(Object? args) {
    pushNamed(LaundryPricePaths.laundryPriceFormName, extra: args);
  }
}
