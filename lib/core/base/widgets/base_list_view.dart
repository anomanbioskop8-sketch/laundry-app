// =============================================================================
// File        : base_list_view.dart
// Path        : core/base/widgets/base_list_view.dart
// Layer       : Presentation (UI - Reusable Component)
// -----------------------------------------------------------------------------
// BaseListView<T>
//
// Responsibility:
// - Widget generic untuk menampilkan list data
// - Mengurangi boilerplate ListView.builder
// - Mendukung onTap, separator, empty widget, dll
//
// Features:
// - Generic type <T>
// - Custom itemBuilder
// - Optional onItemTap
// - Optional separator
// - Optional empty state
//
// Usage:
// BaseListView<CustomerEntity>(
//   data: customers,
//   itemBuilder: (item) => Text(item.name),
//   onItemTap: (item) => print(item),
// )
//
// Notes:
// - Tidak ada business logic
// - Pure UI reusable
// =============================================================================

import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {
  /// 📦 Data list
  final List<T> data;

  /// 🧱 Builder item UI
  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  /// 👆 Callback saat item ditekan
  final void Function(T item)? onItemTap;

  /// 🔹 Separator (optional)
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  /// 📭 Empty widget (optional)
  final Widget? empty;

  /// Scroll config
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const BaseListView({
    super.key,
    required this.data,
    required this.itemBuilder,
    this.onItemTap,
    this.separatorBuilder,
    this.empty,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    // ===========================================================
    // EMPTY STATE
    // ===========================================================
    if (data.isEmpty) {
      return empty ?? const Center(child: Text('Data kosong'));
    }

    // ===========================================================
    // LIST VIEW
    // ===========================================================
    if (separatorBuilder != null) {
      return ListView.separated(
        padding: padding,
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemCount: data.length,
        separatorBuilder: separatorBuilder!,
        itemBuilder: (context, index) {
          final item = data[index];

          return _wrapTap(context, item, index);
        },
      );
    }

    return ListView.builder(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];

        return _wrapTap(context, item, index);
      },
    );
  }

  // ===========================================================
  // INTERNAL: TAP WRAPPER
  // ===========================================================
  Widget _wrapTap(BuildContext context, T item, int index) {
    final child = itemBuilder(context, item, index);

    if (onItemTap == null) return child;

    return InkWell(onTap: () => onItemTap!(item), child: child);
  }
}
