import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_tab_bar.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry_price/presentation/widgets/laundry_price_view.dart';
import 'package:flutter/material.dart';

class LaundryPricePage extends StatelessWidget {
  final String itemName;

  const LaundryPricePage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text(itemName)),
        body: Column(
          children: [
            /// =========================
            /// TAB BAR (DI BAWAH HEADER)
            /// =========================
            AppTabBar(
              tabs: [
                LaundryServiceType.regular.label,
                LaundryServiceType.express.label,
                LaundryServiceType.sameDay.label,
              ],
            ),

            context.spacing.lg.h,

            /// =========================
            /// TAB CONTENT
            /// =========================
            Expanded(
              child: TabBarView(
                children: [
                  LaundryPriceView(serviceType: LaundryServiceType.regular),
                  LaundryPriceView(serviceType: LaundryServiceType.express),
                  LaundryPriceView(serviceType: LaundryServiceType.sameDay),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
