import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemSelectionCubit extends Cubit<OrderItemSelectionState> {
  OrderItemSelectionCubit()
    : super(const OrderItemSelectionState(selectedItems: []));

  void toggle(OrderLaundryItemEntity item, bool selected) {
    final items = [...state.selectedItems];

    if (selected) {
      final exists = items.any((e) => e.itemId == item.itemId);

      if (!exists) {
        items.add(item.copyWith(qty: 1));
      }
    } else {
      items.removeWhere((e) => e.itemId == item.itemId);
    }

    emit(OrderItemSelectionState(selectedItems: items));
  }

  void updateQty(String itemId, int qty) {
    final items = [...state.selectedItems];

    final index = items.indexWhere((e) => e.itemId == itemId);

    if (index == -1) return;

    items[index] = items[index].copyWith(qty: qty <= 0 ? 1 : qty);

    emit(OrderItemSelectionState(selectedItems: items));
  }
}
