import 'package:app_laundry/core/ui/widgets/navigation/app_tab_bar.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/widgets/info_customer_view.dart';
import 'package:app_laundry/features/customer/presentation/widgets/order_customer_view.dart';
import 'package:flutter/material.dart';

class CustomerDetailPage extends StatelessWidget {
  final CustomerEntity customer;

  const CustomerDetailPage({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text(customer.name)),
        body: Column(
          children: [
            //context.spacing.lg.h,

            /// =========================
            /// HEADER
            /// =========================
            // AppAvatarHeader(
            //   name: customer.name,
            //   subtitle: customer.phone,
            //   initials: customer.initials,
            //   backgroundColor: customer.avatarColor,
            // ),

            // context.spacing.md.h,

            /// =========================
            /// TAB BAR (DI BAWAH HEADER)
            /// =========================
            AppTabBar(tabs: ['Info', 'Orders']),

            /// =========================
            /// TAB CONTENT
            /// =========================
            Expanded(
              child: TabBarView(
                children: [
                  InfoCustomerView(customer: customer),
                  OrderCustomerView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
