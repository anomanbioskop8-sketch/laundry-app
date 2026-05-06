import 'package:flutter/material.dart';

class AppSearchField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const AppSearchField({
    super.key,
    required this.onChanged,
    this.hintText = 'Search...',
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// 🔥 penting: listen perubahan text
    _controller.addListener(() {
      setState(() {}); // rebuild untuk suffixIcon
    });
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
    setState(() {}); // update suffix icon
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),

        /// 🔥 clear button
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(icon: const Icon(Icons.clear), onPressed: _clear)
            : null,

        isDense: true,
      ),
    );
  }
}
