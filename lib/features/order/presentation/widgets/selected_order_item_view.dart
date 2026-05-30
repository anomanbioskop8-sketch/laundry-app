// =============================================================================
// File        : selected_order_item_view.dart
// Path        : lib/features/order/presentation/widgets/selected_order_item_view.dart
// =============================================================================

import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/core/constants/strings/laundry_price_strings.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_laundry_item_cubit.dart';
import 'package:app_laundry/features/order/presentation/widgets/selected_order_item_tile.dart';
import 'package:flutter/material.dart';

class SelectedOrderItemView extends StatefulWidget {
  final LaundrySpeedType type;

  const SelectedOrderItemView({super.key, required this.type});

  @override
  State<SelectedOrderItemView> createState() => _SelectedOrderItemViewState();
}

class _SelectedOrderItemViewState extends State<SelectedOrderItemView> {
  final List<OrderLaundryItemEntity> _selectedItems = [];

  // =========================
  // TOGGLE ITEM
  // =========================

  void _toggleItem(OrderLaundryItemEntity item, bool selected) {
    setState(() {
      if (selected) {
        final exists = _selectedItems.any((e) => e.itemId == item.itemId);

        if (!exists) {
          _selectedItems.add(
            OrderLaundryItemEntity(
              itemId: item.itemId,
              itemName: item.itemName,
              qty: 1,
              price: item.price,
            ),
          );
        }
      } else {
        _selectedItems.removeWhere((e) => e.itemId == item.itemId);
      }
    });
  }

  // =========================
  // UPDATE QTY
  // =========================

  void _updateQty(String itemId, int qty) {
    final index = _selectedItems.indexWhere((e) => e.itemId == itemId);

    if (index == -1) return;

    setState(() {
      _selectedItems[index] = _selectedItems[index].copyWith(
        qty: qty <= 0 ? 1 : qty,
      );
    });
  }

  // =========================
  // SAVE
  // =========================

  void _save() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:
              BaseStreamBuilder<OrderLaundryItemCubit, OrderLaundryItemEntity>(
                empty: AppEmptyWidget(message: LaundryPriceStrings.empty),
                builder: (items) {
                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, index) {
                      final item = items[index];

                      final selectedItem = _selectedItems.where(
                        (e) => e.itemId == item.itemId,
                      );

                      final isSelected = selectedItem.isNotEmpty;

                      final qty = isSelected ? selectedItem.first.qty : 1;

                      return SelectedOrderItemTile(
                        item: item,
                        isSelected: isSelected,
                        qty: qty,
                        onSelected: (selected) {
                          _toggleItem(item, selected);
                        },
                        onQtyChanged: (qty) {
                          _updateQty(item.itemId, qty);
                        },
                      );
                    },
                  );
                },
              ),
        ),

        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _selectedItems.isEmpty ? null : _save,
                icon: const Icon(Icons.save),
                label: Text('Simpan (${_selectedItems.length})'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
