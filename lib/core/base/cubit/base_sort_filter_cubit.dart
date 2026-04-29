import 'package:app_laundry/core/base/models/sort_filter_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortFilterState<T> {
  final SortOption<T>? sort;
  final FilterOption<T>? filter;

  const SortFilterState({this.sort, this.filter});

  SortFilterState<T> copyWith({SortOption<T>? sort, FilterOption<T>? filter}) {
    return SortFilterState(
      sort: sort ?? this.sort,
      filter: filter ?? this.filter,
    );
  }
}

class SortFilterCubit<T> extends Cubit<SortFilterState<T>> {
  SortFilterCubit() : super(const SortFilterState());

  void setSort(SortOption<T> sort) {
    emit(state.copyWith(sort: sort));
  }

  void setFilter(FilterOption<T>? filter) {
    emit(state.copyWith(filter: filter));
  }

  List<T> apply(List<T> data) {
    var result = List<T>.from(data);

    // filter
    if (state.filter != null) {
      result = result.where(state.filter!.predicate).toList();
    }

    // sort
    if (state.sort != null) {
      result.sort((a, b) {
        final aVal = state.sort!.selector(a);
        final bVal = state.sort!.selector(b);

        return state.sort!.ascending
            ? aVal.compareTo(bVal)
            : bVal.compareTo(aVal);
      });
    }

    return result;
  }
}
