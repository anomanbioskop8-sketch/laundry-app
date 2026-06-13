import 'package:flutter/material.dart';

class OrderItemQtyField extends StatefulWidget {
  final int value;
  final bool enabled;
  final ValueChanged<int> onChanged;

  const OrderItemQtyField({
    super.key,
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  @override
  State<OrderItemQtyField> createState() => _OrderItemQtyFieldState();
}

class _OrderItemQtyFieldState extends State<OrderItemQtyField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toString());
  }

  @override
  void didUpdateWidget(covariant OrderItemQtyField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value &&
        _controller.text != widget.value.toString()) {
      _controller.text = widget.value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: TextFormField(
        controller: _controller,
        enabled: widget.enabled,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) {
          widget.onChanged(int.tryParse(value) ?? 1);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
