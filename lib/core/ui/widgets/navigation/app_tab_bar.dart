import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;
  final bool isScrollable;
  final TabAlignment? tabAlignment;

  const AppTabBar({
    super.key,
    required this.tabs,
    this.isScrollable = false,
    this.tabAlignment,
  }) : assert(tabs.length != 0);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs.map((title) => Tab(text: title)).toList(),
      isScrollable: isScrollable,
      tabAlignment: tabAlignment,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
