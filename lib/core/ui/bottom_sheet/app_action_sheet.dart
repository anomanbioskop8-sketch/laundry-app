// =============================================================================
// File        : app_action_sheet.dart
// Path        : lib/core/ui/bottom_sheet/app_action_sheet.dart
// Layer       : Presentation (Bottom Sheet)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menampilkan action sheet global berbasis modal bottom sheet
// - Digunakan untuk daftar aksi seperti:
//   → View
//   → Edit
//   → Delete
//   → Share
// - Mendukung filtering visibility melalui ActionItem.canShow
// - Menyediakan UI action yang konsisten di seluruh aplikasi
//
// Features:
// - Rounded top corner
// - Safe area support
// - Auto hide jika tidak ada action visible
// - Scrollable jika action terlalu banyak
// - Support destructive / warning color via ActionIntent
// =============================================================================

import 'package:app_laundry/core/theme/extensions/theme_radius_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_intent.dart';
import 'package:app_laundry/core/ui/bottom_sheet/action_intent_ext.dart';
import 'package:flutter/material.dart';

import 'action_item.dart';

class AppActionSheet {
  AppActionSheet._();

  // ===========================================================================
  // SHOW
  // ===========================================================================
  //
  // Menampilkan modal action sheet.
  //
  // Params:
  // - [title]   → Judul action sheet
  // - [actions] → List action yang akan ditampilkan
  //
  // Notes:
  // - Action dengan canShow == false otomatis disembunyikan
  // - Jika semua action hidden maka sheet tidak ditampilkan
  // ===========================================================================

  static void show(
    BuildContext context, {
    String? title,
    List<ActionItem> actions = const [],
  }) {
    final visibleActions = actions
        .where((a) => a.canShow?.call() ?? true)
        .toList();

    // 🔒 Tidak tampil jika kosong
    if (visibleActions.isEmpty) {
      return;
    }

    final spacing = context.spacing;

    showModalBottomSheet(
      context: context,

      backgroundColor: Colors.transparent,

      isScrollControlled: true,

      builder: (_) => Padding(
        padding: EdgeInsets.all(spacing.lg),

        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.surface,

              borderRadius: context.radius.lg.r,
            ),

            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  // =========================
                  // HEADER
                  // =========================
                  if (title != null) _Header(title: title),

                  // =========================
                  // ACTIONS
                  // =========================
                  Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,

                      itemCount: visibleActions.length,

                      separatorBuilder: (_, _) => const Divider(),

                      itemBuilder: (_, index) {
                        final action = visibleActions[index];

                        return _ActionTile(action: action);
                      },
                    ),
                  ),

                  spacing.sm.h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HEADER
// -----------------------------------------------------------------------------
// Header section untuk Action Sheet.
//
// Fungsi:
// - Menampilkan drag handle
// - Menampilkan title action sheet
// =============================================================================

class _Header extends StatelessWidget {
  final String title;

  const _Header({required this.title});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Column(
      children: [
        spacing.sm.h,

        // =========================
        // DRAG HANDLE
        // =========================
        Container(
          width: 40,
          height: 4,

          decoration: BoxDecoration(
            color: context.colors.outlineVariant,

            borderRadius: context.radius.sm.r,
          ),
        ),

        spacing.md.h,

        // =========================
        // TITLE
        // =========================
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing.lg),

          child: Text(
            title,
            style: context.text.titleMedium!.semiBold.onSurface(context),
          ),
        ),

        spacing.sm.h,
      ],
    );
  }
}

// =============================================================================
// ACTION TILE
// -----------------------------------------------------------------------------
// Tile item untuk setiap action.
//
// Fungsi:
// - Menampilkan icon action
// - Menampilkan title action
// - Menjalankan callback saat ditekan
// =============================================================================

class _ActionTile extends StatelessWidget {
  final ActionItem action;

  const _ActionTile({required this.action});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(action.icon, color: action.intent.color(context)),
      title: Text(
        action.title,
        style: action.intent == ActionIntent.delete
            ? context.text.labelLarge?.semiBold.copyWith(
                color: action.intent.color(context),
              )
            : context.text.labelLarge?.onSurface(context),
      ),
      onTap: () {
        Navigator.pop(context);
        action.onTap();
      },
    );
  }
}
