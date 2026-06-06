import 'package:app_laundry/core/theme/extensions/theme_spacing_ext.dart';
import 'package:app_laundry/core/ui/components/info_info_item.dart';
import 'package:flutter/material.dart';

class AppInfoCard extends StatelessWidget {
  final List<AppInfoItem> items;

  const AppInfoCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: spacing.md),
        child: ListView.separated(
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
        ),
      ),
    );
  }
}
