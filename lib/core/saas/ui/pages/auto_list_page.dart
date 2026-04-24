import 'package:app_laundry/core/saas/config/crud_config.dart';
import 'package:app_laundry/core/saas/config/module_config.dart';
import 'package:app_laundry/core/saas/state/auto_crud_cubit.dart';
import 'package:app_laundry/core/saas/ui/widgets/base_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoListPage<T> extends StatefulWidget {
  final AutoCrudCubit<T> cubit;
  final ModuleConfig<T> config;

  const AutoListPage({super.key, required this.cubit, required this.config});

  @override
  State<AutoListPage<T>> createState() => _AutoListPageState<T>();
}

//
class _AutoListPageState<T> extends State<AutoListPage<T>> {
  @override
  void initState() {
    super.initState();

    widget.cubit.bind(
      stream: widget.config.stream(),
      filter: (item, keyword) {
        /// 🔥 TEMP DEFAULT FILTER (biar tidak crash)
        return item.toString().toLowerCase().contains(keyword.toLowerCase());
      },
      sort: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.config.name)),

      body: Column(
        children: [
          TextField(
            onChanged: (v) {
              widget.cubit.search(
                v,
                (item, keyword) =>
                    item.toString().toLowerCase().contains(keyword),
                null,
              );
            },
          ),

          Expanded(
            child: BlocBuilder<AutoCrudCubit<T>, List<T>>(
              bloc: widget.cubit,
              builder: (context, state) {
                if (state.isEmpty) {
                  return const Center(child: Text("Empty"));
                }

                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (_, i) {
                    final item = state[i];

                    return InkWell(
                      onTap: () => _openSheet(context, item),

                      /// 🔥 AUTO RENDER
                      child: widget.config.itemBuilder(context, item),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openSheet(BuildContext context, T item) {
    final actions = widget.config.actions;

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: actions.map((a) {
              return ListTile(
                leading: Icon(a.icon),
                title: Text(a.label),
                onTap: () => a.onTap(context, item),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
