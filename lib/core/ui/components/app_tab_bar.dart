// =============================================================================
// File        : app_tab_bar.dart
// Path        : lib/core/widgets/app_tab_bar.dart
// Layer       : Core (Reusable Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Widget global untuk menampilkan TabBar
// - Mendukung penggunaan ulang di seluruh aplikasi
// - Menyederhanakan pembuatan tab dengan list title
// - Menjaga konsistensi UI tab antar halaman
// =============================================================================

import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;

  const AppTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: tabs.map((title) => Tab(text: title)).toList());
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
