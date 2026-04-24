// =============================================================================
// File        : base_crud_cubit.dart
// Layer       : State Management (SaaS V2 Engine)
// =============================================================================

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCrudCubit<T> extends Cubit<List<T>> {
  BaseCrudCubit() : super(const []);

  List<T> _allData = [];
  String _keyword = '';

  Timer? _debounce;
  StreamSubscription? _sub;

  // =========================================================
  // PIPELINE CONFIG (SAFE DEFAULT)
  // =========================================================
  bool Function(T item, String keyword)? _filterFn;
  List<T> Function(List<T>)? _sortFn;

  void configure({
    required bool Function(T item, String keyword) filter,
    List<T> Function(List<T>)? sort,
  }) {
    _filterFn = filter;
    _sortFn = sort;
  }

  // =========================================================
  // STREAM
  // =========================================================
  void listen(Stream<List<T>> Function() stream) {
    _sub?.cancel();

    _sub = stream().listen((data) {
      _allData = data;
      //_apply();
    });
  }

  // =========================================================
  // SEARCH
  // =========================================================
  void search(
    String keyword, {
    Duration debounce = const Duration(milliseconds: 300),
  }) {
    _debounce?.cancel();

    _debounce = Timer(debounce, () {
      _keyword = keyword;
      _apply();
    });
  }

  void searchNow(String keyword) {
    _keyword = keyword;
    _apply();
  }

  // =========================================================
  // ENGINE CORE (SAFE)
  // =========================================================
  void _apply() {
    if (_allData.isEmpty) {
      emit(const []);
      return;
    }

    var result = _allData;

    // 🔐 SAFE FILTER (NO CRASH)
    final filter = _filterFn;
    if (filter != null && _keyword.isNotEmpty) {
      result = result.where((e) => filter(e, _keyword)).toList();
    }

    // 🔐 SORT
    final sort = _sortFn;
    if (sort != null) {
      result = sort(result);
    }

    emit(result);
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    _sub?.cancel();
    return super.close();
  }
}
