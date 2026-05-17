// =============================================================================
// File : order_group_field_widget.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/core/constants/order_strings.dart';
import 'package:app_laundry/core/ui/components/app_outlined_action_button.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderGroupFieldWidget extends StatefulWidget {
  final List<OrderGroupEntity> groups;
  final ValueChanged<List<OrderGroupEntity>> onChanged;

  const OrderGroupFieldWidget({
    super.key,
    required this.groups,
    required this.onChanged,
  });

  @override
  State<OrderGroupFieldWidget> createState() => _OrderGroupFieldWidgetState();
}

class _OrderGroupFieldWidgetState extends State<OrderGroupFieldWidget> {
  late List<OrderGroupEntity> groups;

  @override
  void initState() {
    super.initState();
    groups = [...widget.groups];
  }

  // =========================
  // ADD GROUP
  // =========================

  Future<void> _addGroup() async {
    final result = await context.pushNamed<OrderGroupEntity>(
      OrderPaths.orderGroupFormName,
    );

    if (result == null) return;

    setState(() {
      groups.add(result);
    });

    widget.onChanged(groups);
  }

  // =========================
  // REMOVE GROUP
  // =========================

  void _removeGroup(OrderGroupEntity group) {
    setState(() {
      groups.remove(group);
    });

    widget.onChanged(groups);
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
            onPressed: _addGroup,
            icon: Icons.add_outlined,
            label: OrderStrings.addGroup,
          ),
        ),

        const SizedBox(height: 16),

        // =========================
        // EMPTY
        // =========================
        if (groups.isEmpty) AppEmptyWidget(message: OrderStrings.emptyGroup),

        // =========================
        // LIST
        // =========================
        if (groups.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            itemCount: groups.length,

            itemBuilder: (_, i) {
              return OrderGroupCard(
                group: groups[i],

                onDelete: () {
                  _removeGroup(groups[i]);
                },
              );
            },

            separatorBuilder: (_, i) => const Divider(),
          ),
      ],
    );
  }
}
