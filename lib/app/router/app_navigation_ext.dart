// import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'route_paths.dart';

// /// =============================================================================
// /// File        : app_navigation_x.dart
// /// Path        : core/navigation/app_navigation_x.dart
// /// Layer       : Core (Navigation UI Extension)
// /// -----------------------------------------------------------------------------
// /// Fungsi:
// /// - Extension navigation untuk UI layer
// /// - Wrapper GoRouter agar lebih readable & domain-friendly
// /// - Menghindari penggunaan route string langsung di UI
// ///
// /// Notes:
// /// - UI ONLY (jangan dipakai di service/cubit)
// /// - Gunakan NavigationService untuk business logic
// /// =============================================================================

// extension AppNavigationX on BuildContext {
//   // =========================================================
//   // BASIC NAVIGATION
//   // =========================================================

//   void goLogin() => goNamed(AuthPaths.loginName);

//   void goRegister() => pushNamed(AuthPaths.registerName);

//   void goHome() => goNamed(MainPaths.mainName);

//   void goSplash() => goNamed(AuthPaths.splashName);

//   // =========================================================
//   // CUSTOMER
//   // =========================================================

//   void goCustomers({bool isPicker = false}) {
//     pushNamed(CustomerPaths.customersName, extra: isPicker);
//   }

//   void goCustomerForm(Object? customer) {
//     pushNamed(CustomerPaths.customerFormName, extra: customer);
//   }

//   void goCustomerDetail(Object? customer) {
//     pushNamed(CustomerPaths.customerDetailName, extra: customer);
//   }

//   // =========================================================
//   // ORDER
//   // =========================================================

//   void goOrderForm({OrderEntity? order}) {
//     pushNamed(OrderPaths.orderFormName, extra: null);
//   }

//   void goOrderGroupForm() {
//     pushNamed(OrderPaths.orderGroupFormName);
//   }

//   // =========================================================
//   // LAUNDRY ITEM
//   // =========================================================

//   void goLaundryItemForm(Object? item) {
//     pushNamed(LaundryItemPaths.laundryItemFormName, extra: item);
//   }

//   // =========================================================
//   // LAUNDRY PRICE
//   // =========================================================

//   void goLaundryPrice(Object? price) {
//     pushNamed(LaundryPricePaths.laundryPriceName, extra: price);
//   }

//   void goLaundryPriceForm(Object? price) {
//     pushNamed(LaundryPricePaths.laundryPriceFormName, extra: price);
//   }

//   // =========================================================
//   // BACK NAVIGATION
//   // =========================================================

//   void back<T extends Object?>([T? result]) {
//     if (canPop()) {
//       pop(result);
//     }
//   }
// }
