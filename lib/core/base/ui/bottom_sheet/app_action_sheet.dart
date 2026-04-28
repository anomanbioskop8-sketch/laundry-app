// core/base/ui/bottom_sheet/base_action_sheet.dart

import 'package:app_laundry/core/theme/dialog/dialog_color_mapper.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';
import 'action_item.dart';

class AppActionSheet {
  AppActionSheet._();

  static void show(
    BuildContext context, {
    String? title,
    List<ActionItem> actions = const [],
  }) {
    final visibleActions = actions
        .where((a) => a.canShow?.call() ?? true)
        .toList();

    if (visibleActions.isEmpty) return;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // =========================
              // HEADER
              // =========================
              if (title != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.colors.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),
              ],

              // =========================
              // ACTION LIST
              // =========================
              ...visibleActions.map((action) {
                final color = DialogColorMapper.primary(context, action.type);
                return ListTile(
                  leading: Icon(action.icon, color: color),
                  title: Text(action.title),
                  onTap: () {
                    Navigator.pop(context);
                    action.onTap();
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
