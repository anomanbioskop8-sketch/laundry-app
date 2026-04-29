import 'dart:async';

import 'package:app_laundry/core/base/cubit/base_stream_cubit.dart';
import 'package:app_laundry/core/base/cubit/base_stream_state.dart';

typedef FieldSelector<T> = String Function(T item);

abstract class BaseSearchCubit<T> extends BaseStreamCubit<T> {
  BaseSearchCubit();

  List<T> _allData = [];
  String _query = '';

  Timer? _debounce;

  /// =========================
  /// FIELD CONFIG (WAJIB DI OVERRIDE)
  /// =========================
  List<FieldSelector<T>> get searchFields;

  /// =========================
  /// OPTIONAL CUSTOM FILTER
  /// =========================
  bool Function(T item)? get customFilter => null;

  /// =========================
  /// DATA MASUK DARI STREAM
  /// =========================
  @override
  void onData(List<T> data) {
    _allData = data;
    _apply();
  }

  /// =========================
  /// SEARCH (AUTO DEBOUNCE)
  /// =========================
  void search(String query) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      _query = query.toLowerCase();
      _apply();
    });
  }

  /// =========================
  /// APPLY FILTER
  /// =========================
  void _apply() {
    final filtered = _allData.where((item) {
      final matchQuery =
          _query.isEmpty ||
          searchFields.any(
            (selector) => selector(item).toLowerCase().contains(_query),
          );

      final matchCustom = customFilter == null || customFilter!(item);

      return matchQuery && matchCustom;
    }).toList();

    if (filtered.isEmpty) {
      emit(const BaseStreamState.empty());
    } else {
      emit(BaseStreamState.loaded(filtered));
    }
  }

  /// =========================
  /// CLEANUP
  /// =========================
  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
