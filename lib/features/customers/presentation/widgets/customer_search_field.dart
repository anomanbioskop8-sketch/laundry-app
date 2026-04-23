import 'package:flutter/material.dart';

class CustomerSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomerSearchField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Cari customer...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
