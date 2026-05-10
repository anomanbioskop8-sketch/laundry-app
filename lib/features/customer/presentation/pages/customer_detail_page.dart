import 'package:app_laundry/core/ui/components/app_tab_bar.dart';
import 'package:app_laundry/core/ui/components/avatar/app_avatar_header.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/extensions/customer_ui_extension.dart';
import 'package:app_laundry/features/customer/presentation/widgets/info_customer_view.dart';
import 'package:flutter/material.dart';

class CustomerDetailPage extends StatelessWidget {
  final CustomerEntity customer;

  const CustomerDetailPage({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            /// =========================
            /// HEADER
            /// =========================
            AppAvatarHeader(
              name: customer.name,
              subtitle: customer.phone,
              initials: customer.initials,
              backgroundColor: customer.avatarColor,
            ),

            context.spacing.md.h,

            /// =========================
            /// TAB BAR (DI BAWAH HEADER)
            /// =========================
            const AppTabBar(tabs: ['Info', 'Orders']),

            /// =========================
            /// TAB CONTENT
            /// =========================
            Expanded(
              child: TabBarView(
                children: [
                  InfoCustomerView(customer: customer),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
