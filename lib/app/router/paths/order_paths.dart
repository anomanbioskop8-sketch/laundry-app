// =============================================================================
// File        : order_paths.dart
// Path        : lib/app/router/paths/order_paths.dart
// =============================================================================

abstract final class OrderPaths {
  // =========================
  // NAME
  // =========================

  static const order = 'order';
  static const orderForm = 'orderForm';
  static const orderGroupForm = 'orderGroupForm';
  static const orderLaundryItemForm = 'orderLaundryItemForm';
  static const orderConfirmation = 'orderConfirmation';

  // =========================
  // PATH
  // =========================

  static const orderPath = '/orders';
  static const orderFormPath = '/orders/form';
  static const orderGroupFormPath = '/orders/form/group-form';
  static const orderLaundryItemFormPath =
      '/orders/form/group-form/laundry-item-form';
  static const orderConfirmationPath = '/orders/confirmation';
}
