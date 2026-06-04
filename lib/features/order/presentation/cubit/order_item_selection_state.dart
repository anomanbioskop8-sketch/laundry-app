import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class OrderItemSelectionState {
  final List<OrderLaundryItemEntity> selectedItems;

  const OrderItemSelectionState({required this.selectedItems});

  bool get canSave => selectedItems.isNotEmpty;

  int get selectedCount => selectedItems.length;
}
