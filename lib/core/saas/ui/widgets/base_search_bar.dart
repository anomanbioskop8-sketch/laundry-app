import 'package:flutter/material.dart';

class BaseSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const BaseSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
