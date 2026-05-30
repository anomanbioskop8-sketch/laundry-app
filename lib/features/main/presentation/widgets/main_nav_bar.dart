import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/company_strings.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:flutter/material.dart';

class MainNavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  const MainNavBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(AppIcons.customers),
          label: CustomerStrings.title,
        ),
        NavigationDestination(
          icon: Icon(AppIcons.items),
          label: LaundryItemStrings.title,
        ),
        NavigationDestination(
          icon: Icon(AppIcons.order),
          label: OrderStrings.title,
        ),
        NavigationDestination(
          icon: Icon(AppIcons.company),
          label: CompanyStrings.title,
        ),
      ],
    );
  }
}
