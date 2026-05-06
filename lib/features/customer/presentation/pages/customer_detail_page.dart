import 'package:app_laundry/core/ui/components/app_info_card.dart';
import 'package:app_laundry/core/ui/components/avatar/app_avatar_header.dart';
import 'package:app_laundry/core/ui/components/info_info_item.dart';
import 'package:app_laundry/core/ui/states/app_empty_widget.dart';
import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/extensions/customer_ui_extension.dart';
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
            const _TabBarSection(),

            /// =========================
            /// TAB CONTENT
            /// =========================
            Expanded(
              child: TabBarView(
                children: [
                  _InfoTab(customer: customer),
                  _OrderTab(customer: customer),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarSection extends StatelessWidget {
  const _TabBarSection();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(text: "Info"),
        Tab(text: "Orders"),
      ],
    );
  }
}

class _InfoTab extends StatelessWidget {
  final CustomerEntity customer;

  const _InfoTab({required this.customer});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.lg),
      child: _InfoCard(customer: customer),
    );
  }
}

class _OrderTab extends StatelessWidget {
  final CustomerEntity customer;

  const _OrderTab({required this.customer});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(context.spacing.md),
      children: [
        Text("Order History", style: context.theme.textTheme.titleLarge),
        context.spacing.md.h,
        AppEmptyWidget(),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final CustomerEntity customer;

  const _InfoCard({required this.customer});

  @override
  Widget build(BuildContext context) {
    return AppInfoCard(
      items: [
        AppInfoItem(icon: Icons.person, label: 'Nama', value: customer.name),
        AppInfoItem(icon: Icons.phone, label: 'Telepon', value: customer.phone),
        AppInfoItem(
          icon: Icons.calendar_today,
          label: 'Created',
          value: customer.createdAt.readable,
        ),
        AppInfoItem(
          icon: Icons.update,
          label: 'Update',
          value: customer.updatedAt.readable,
        ),
      ],
    );
  }
}
