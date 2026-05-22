import 'package:app_laundry/features/company/presentation/pages/company_page_wrapper.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_page_wrapper.dart';
import 'package:app_laundry/features/laundry_item/presentation/pages/laundry_item_page_wrapper.dart';
import 'package:app_laundry/features/main/presentation/widgets/main_nav_bar.dart';
import 'package:app_laundry/features/order/presentation/pages/order_page_wrapper.dart';
import 'package:app_laundry/features/setting/presentation/wrappers/setting_page_wrapper.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final _pages = const [
    CustomerPageWrapper(),
    LaundryItemPageWrapper(),
    OrderPageWrapper(),
    SettingPageWrapper(),
  ];

  void _onTap(int i) {
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),

      bottomNavigationBar: MainNavBar(index: _index, onTap: _onTap),

      // NavigationBar(
      //   selectedIndex: _index,
      //   onDestinationSelected: _onTap,
      //   destinations: const [
      //     NavigationDestination(
      //       icon: Icon(Icons.people_outline),
      //       selectedIcon: Icon(Icons.people),
      //       label: 'Customer',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.receipt_long_outlined),
      //       selectedIcon: Icon(Icons.receipt_long),
      //       label: 'Items',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.bar_chart_outlined),
      //       selectedIcon: Icon(Icons.bar_chart),
      //       label: 'Orders',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.settings_outlined),
      //       selectedIcon: Icon(Icons.settings),
      //       label: 'Company',
      //     ),
      //   ],
      // ),
    );
  }
}
