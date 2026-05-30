// =============================================================================
// File : order_group_field_widget.dart
// =============================================================================

import 'package:app_laundry/app/router/extensions/push/order_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_outlined_action_button.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:flutter/material.dart';

class OrderLaundryItemFieldWidget extends StatefulWidget {
  final List<OrderLaundryItemEntity> items;
  final ValueChanged<List<OrderLaundryItemEntity>> onChanged;

  const OrderLaundryItemFieldWidget({
    super.key,
    required this.items,
    required this.onChanged,
  });

  @override
  State<OrderLaundryItemFieldWidget> createState() =>
      _OrderLaundryItemFieldWidgetState();
}

class _OrderLaundryItemFieldWidgetState
    extends State<OrderLaundryItemFieldWidget> {
  late List<OrderLaundryItemEntity> items;

  @override
  void initState() {
    super.initState();
    items = [...widget.items];
  }

  @override
  void didUpdateWidget(covariant OrderLaundryItemFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.items != widget.items) {
      items = [...widget.items];
    }
  }

  // =========================
  // ADD ITEM
  // =========================

  Future<void> _addItem() async {
    final result = await context.pushOrderLaundryItemForm();

    if (result == null) return;

    if (result is! List<OrderLaundryItemEntity>) {
      return;
    }

    setState(() {
      for (final item in result) {
        final index = items.indexWhere((e) => e.itemId == item.itemId);

        if (index >= 0) {
          items[index] = item;
        } else {
          items.add(item);
        }
      }
    });

    widget.onChanged(items);
  }

  // =========================
  // REMOVE ITEM
  // =========================

  void _removeItem(OrderLaundryItemEntity item) {
    setState(() {
      items.removeWhere((e) => e.itemId == item.itemId);
    });

    widget.onChanged(items);
  }

  // =========================
  // TOTAL
  // =========================

  double get totalPrice {
    return items.fold(0, (sum, item) => sum + (item.price * item.qty));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // =========================
        // BUTTON
        // =========================
        SizedBox(
          width: double.infinity,
          child: AppOutlinedActionButton(
            onPressed: _addItem,
            icon: AppIcons.add,
            label: OrderStrings.addItem,
          ),
        ),

        context.spacing.md.h,

        // =========================
        // EMPTY
        // =========================
        if (items.isEmpty)
          AppEmptyWidget(message: OrderStrings.emptyItem, icon: AppIcons.order),

        // =========================
        // LIST
        // =========================
        if (items.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (_, index) {
              final item = items[index];

              return ListTile(
                contentPadding: EdgeInsets.zero,

                title: Text(item.itemName, style: context.titleSmall),

                subtitle: Text(
                  '${item.qty} x ${item.price.toStringAsFixed(0)}',
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (item.qty * item.price).toStringAsFixed(0),
                      style: context.titleSmall,
                    ),

                    IconButton(
                      onPressed: () {
                        _removeItem(item);
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              );
            },
          ),

        // =========================
        // TOTAL
        // =========================
        if (items.isNotEmpty) ...[
          context.spacing.sm.h,
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: context.titleMedium),
              Text(totalPrice.toStringAsFixed(0), style: context.titleMedium),
            ],
          ),
        ],
      ],
    );
  }
}
