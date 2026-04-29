import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/base_sort_filter_cubit.dart';
import '../models/sort_filter_config.dart';

class SortFilterBar<T> extends StatelessWidget {
  final List<SortOption<T>> sorts;
  final List<FilterOption<T>> filters;
  final SortFilterCubit<T> cubit;

  const SortFilterBar({
    super.key,
    required this.sorts,
    required this.filters,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortFilterCubit<T>, SortFilterState<T>>(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            /// SORT
            Expanded(
              child: DropdownButton<SortOption<T>>(
                value: state.sort,
                hint: const Text("Sort"),
                isExpanded: true,
                items: sorts.map((s) {
                  return DropdownMenuItem(value: s, child: Text(s.label));
                }).toList(),
                onChanged: (s) {
                  if (s != null) cubit.setSort(s);
                },
              ),
            ),

            const SizedBox(width: 8),

            /// FILTER
            Expanded(
              child: DropdownButton<FilterOption<T>>(
                value: state.filter,
                hint: const Text("Filter"),
                isExpanded: true,
                items: filters.map((f) {
                  return DropdownMenuItem(value: f, child: Text(f.label));
                }).toList(),
                onChanged: (f) {
                  cubit.setFilter(f);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
