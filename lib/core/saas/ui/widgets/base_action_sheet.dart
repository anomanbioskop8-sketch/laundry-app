import 'package:flutter/material.dart';
import '../../models/crud_action.dart';

class BaseActionSheet extends StatelessWidget {
  final String? title;
  final List<CrudAction> actions;

  const BaseActionSheet({super.key, this.title, required this.actions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          if (title != null)
            Padding(padding: const EdgeInsets.all(16), child: Text(title!)),

          ...actions.map(
            (e) => ListTile(
              leading: Icon(e.icon, color: e.color),
              title: Text(e.label),
              onTap: () async {
                Navigator.pop(context);
                await e.onTap(null);
              },
            ),
          ),
        ],
      ),
    );
  }
}
