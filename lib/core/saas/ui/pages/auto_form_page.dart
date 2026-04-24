import 'package:app_laundry/core/saas/config/module_config.dart';
import 'package:app_laundry/core/saas/engine/auto_form_engine.dart';
import 'package:app_laundry/core/saas/ui/widgets/auto_field.dart';
import 'package:flutter/material.dart';

class AutoFormPage<T> extends StatefulWidget {
  final ModuleConfig<T> config;
  final T Function(Map<String, dynamic>) mapper;

  const AutoFormPage({super.key, required this.config, required this.mapper});

  @override
  State<AutoFormPage<T>> createState() => _AutoFormPageState<T>();
}

class _AutoFormPageState<T> extends State<AutoFormPage<T>> {
  final engine = AutoFormEngine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.config.name)),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...widget.config.fields.map(
            (field) => AutoField(config: field, onChanged: engine.set),
          ),

          ElevatedButton(
            onPressed: () {
              final data = engine.build(widget.mapper);
              Navigator.pop(context, data);
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
