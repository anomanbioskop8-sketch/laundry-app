import 'package:app_laundry/features/company/presentation/wrappers/company_page_wrapper.dart';
import 'package:app_laundry/features/customer/presentation/wrappers/customer_page_wrapper.dart';
import 'package:app_laundry/features/laundry_item/presentation/wrappers/laundry_item_page_wrapper.dart';
import 'package:app_laundry/features/main/presentation/widgets/main_nav_bar.dart';
import 'package:app_laundry/features/order/presentation/wrappers/order_page_wrapper.dart';
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
    //SettingPageWrapper(),
    CompanyPageWrapper(),
  ];

  void _onTap(int i) {
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: MainNavBar(index: _index, onTap: _onTap),
    );
  }
}
