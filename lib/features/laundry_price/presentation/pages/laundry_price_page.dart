import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/navigation/app_tab_bar.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
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
                LaundrySpeedType.regular.label,
                LaundrySpeedType.express.label,
                LaundrySpeedType.sameDay.label,
              ],
            ),

            context.spacing.lg.h,

            /// =========================
            /// TAB CONTENT
            /// =========================
            Expanded(
              child: TabBarView(
                children: [
                  LaundryPriceView(speedType: LaundrySpeedType.regular),
                  LaundryPriceView(speedType: LaundrySpeedType.express),
                  LaundryPriceView(speedType: LaundrySpeedType.sameDay),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
