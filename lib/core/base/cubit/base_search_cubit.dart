// =============================================================================
// File        : base_search_cubit.dart
// Path        : core/base/cubit/base_search_cubit.dart
// Layer       : Presentation (State Management - Base)
// -----------------------------------------------------------------------------
// BaseSearchCubit<T>
//
// Responsibility:
// - Mengelola data list + fitur search (filter + sort).
// - Terintegrasi dengan stream (Firestore / API realtime).
// - Menyediakan debounce untuk optimasi search input.
//
// Features:
// - Stream subscription (real-time data)
// - Keyword search (debounce & instant)
// - Filter (mandatory override)
// - Sorting (optional override)
//
// Usage:
// - Extend di feature (CustomerCubit, ProductCubit, dll).
//
// Flow:
// 1. Terima data dari stream
// 2. Simpan ke _allData
// 3. Apply pipeline (filter + sort)
// 4. Emit state (empty / success)
//
// Notes:
// - filter() wajib di-override di child class.
// - sort() optional override.
// - Debounce mencegah spam render saat user mengetik.
// =============================================================================

import 'dart:async';

import 'package:app_laundry/core/base/cubit/base_cubit.dart';
import 'package:app_laundry/core/base/cubit/base_state.dart';

abstract class BaseSearchCubit<T> extends BaseCubit<List<T>> {
  BaseSearchCubit();

  // ===========================================================================
  // INTERNAL STATE
  // ===========================================================================

  /// Menyimpan semua data dari stream (source of truth)
  List<T> _allData = [];

  /// Keyword pencarian aktif
  String _keyword = '';

  /// Debounce handler untuk search input
  Timer? _debounce;

  // ===========================================================================
  // STREAM INTEGRATION
  // ===========================================================================
  //
  // Menghubungkan stream ke search pipeline
  //

  void executeSearchStream({required Stream<List<T>> Function() stream}) {
    executeStream(
      stream: stream,
      isList: true,
      onData: (data) {
        _allData = data;
        _applyPipeline();
      },
    );
  }

  // ===========================================================================
  // SEARCH (DEBOUNCE)
  // ===========================================================================
  //
  // Digunakan saat user mengetik (TextField)
  //

  void search(
    String keyword, {
    Duration debounce = const Duration(milliseconds: 300),
  }) {
    _debounce?.cancel();

    _debounce = Timer(debounce, () {
      _keyword = keyword;
      _applyPipeline();
    });
  }

  // ===========================================================================
  // SEARCH (INSTANT)
  // ===========================================================================
  //
  // Digunakan untuk trigger langsung (tanpa debounce)
  //

  void searchNow(String keyword) {
    _keyword = keyword;
    _applyPipeline();
  }

  // ===========================================================================
  // CORE PIPELINE
  // ===========================================================================
  //
  // Tahapan:
  // 1. Validasi data
  // 2. Filter berdasarkan keyword
  // 3. Sorting (optional)
  // 4. Emit state
  //

  void _applyPipeline() {
    // =========================
    // EMPTY CHECK (SOURCE DATA)
    // =========================
    if (_allData.isEmpty) {
      emit(BaseEmpty());
      return;
    }

    List<T> result = _allData;

    // =========================
    // FILTER
    // =========================
    if (_keyword.isNotEmpty) {
      result = result.where((item) => filter(item, _keyword)).toList();
    }

    // =========================
    // SORT (OPTIONAL)
    // =========================
    result = sort(result);

    // =========================
    // FINAL STATE
    // =========================
    if (result.isEmpty) {
      emit(BaseEmpty());
    } else {
      emit(BaseSuccess(result));
    }
  }

  // ===========================================================================
  // OVERRIDABLE METHODS
  // ===========================================================================

  /// 🔍 WAJIB di-override
  ///
  /// Contoh:
  /// return item.name.toLowerCase().contains(keyword.toLowerCase());
  bool filter(T item, String keyword);

  /// 🔄 Optional override untuk sorting
  ///
  /// Default: tidak ada perubahan
  List<T> sort(List<T> data) => data;

  // ===========================================================================
  // CLEANUP
  // ===========================================================================
  //
  // Mencegah memory leak (debounce timer)
  //

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
