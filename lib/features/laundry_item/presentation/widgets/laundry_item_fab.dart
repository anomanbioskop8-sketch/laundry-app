import 'package:app_laundry/app/router/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LaundryItemFab extends StatelessWidget {
  const LaundryItemFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await context.pushNamed(RoutePaths.laundryItemFormName, extra: null);
      },
      child: const Icon(Icons.add),
    );
  }
}
