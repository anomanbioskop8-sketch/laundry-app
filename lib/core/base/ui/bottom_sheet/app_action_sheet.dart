// core/base/ui/bottom_sheet/base_action_sheet.dart

import 'package:app_laundry/core/base/ui/bottom_sheet/action_intent_ext.dart';
import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
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
      shape: RoundedRectangleBorder(
        borderRadius: context.radius.lg.rt, // 🔥 only top radius
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
                context.spacing.sm.h,

                /// Drag handle
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.colors.outlineVariant,
                    borderRadius: context.radius.sm.r,
                  ),
                ),

                context.spacing.md.h,

                Text(title, style: context.text.titleMedium),

                context.spacing.sm.h,
              ],

              // =========================
              // ACTION LIST
              // =========================
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visibleActions.length,

                /// Divider
                separatorBuilder: (_, _) =>
                    Divider(height: 1, color: context.colors.outlineVariant),

                itemBuilder: (_, index) {
                  final action = visibleActions[index];

                  return ListTile(
                    leading: Icon(
                      action.icon,
                      color: action.intent.color(context),
                    ),
                    title: Text(action.title),
                    onTap: () {
                      Navigator.pop(context);
                      action.onTap();
                    },
                  );
                },
              ),

              context.spacing.sm.h,
            ],
          ),
        );
      },
    );
  }
}
