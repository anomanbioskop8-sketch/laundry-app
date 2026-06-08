import 'package:app_laundry/core/ui/widgets/cards/info_card/app_info_item.dart';
import 'package:flutter/material.dart';

class AppInfoCard extends StatelessWidget {
  final List<AppInfoItem> items;

  const AppInfoCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, _) => Divider(),
      itemBuilder: (_, index) {
        final item = items[index];

        return AppInfoItem(
          icon: item.icon,
          label: item.label,
          value: item.value,
        );
      },
    );
  }
}
