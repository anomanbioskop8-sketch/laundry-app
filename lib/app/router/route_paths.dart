// =============================================================================
// File        : route_paths.dart
// Path        : lib/app/router/route_paths.dart
// Layer       : App (Routing)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyimpan seluruh path & name route aplikasi
// - Digunakan oleh GoRouter untuk navigasi yang konsisten
//
// Catatan:
// - Gunakan `name` untuk navigation (recommended)
// - Gunakan `path` untuk deklarasi route
// =============================================================================

class RoutePaths {
  const RoutePaths._(); // 🔒 prevent instantiation

  /// =========================
  /// AUTH
  /// =========================
  static const splash = '/';
  static const splashName = 'splash';

  static const login = '/login';
  static const loginName = 'login';

  static const register = '/register';
  static const registerName = 'register';

  /// =========================
  /// MAIN
  /// =========================
  static const main = '/main';
  static const mainName = 'main';

  /// =========================
  /// CUSTOMER
  /// =========================
  static const customers = '/customers';
  static const customersName = 'customers';

  static const customerForm = '/customer/form';
  static const customerFormName = 'customerForm';

  static const customerDetail = '/customer/detail';
  static const customerDetailName = 'customerDetail';

  /// =========================
  /// OTHER MODULES (SaaS)
  /// =========================
  static const orders = '/orders';
  static const ordersName = 'orders';

  static const employees = '/employees';
  static const employeesName = 'employees';

  static const settings = '/settings';
  static const settingsName = 'settings';

  /// =========================
  /// LAUNDRY ITEM
  /// =========================
  static const laundryItemForm = '/laundry_item/form';
  static const laundryItemFormName = 'laundryItemForm';

  static const laundryPrice = '/laundry_price';
  static const laundryPriceName = 'laundryPrice';

  static const laundryPriceForm = '/laundry_price/form';
  static const laundryPriceFormName = 'laundryPriceForm';

  static const orderForm = '/order/form';
  static const orderFormName = 'orderForm';
  static const orderGroupForm = '/order/form/groupForm';
  static const orderGroupFormName = 'orderGroupForm';
}
