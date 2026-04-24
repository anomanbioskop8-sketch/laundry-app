class AutoCrudEngine<T> {
  List<T> _all = [];
  String _keyword = '';

  void setData(List<T> data) {
    _all = data;
  }

  void search(String keyword) {
    _keyword = keyword;
  }

  List<T> apply({
    required bool Function(T item, String keyword) filter,
    List<T> Function(List<T>)? sort,
  }) {
    var result = _all;

    if (_keyword.isNotEmpty) {
      result = result.where((e) => filter(e, _keyword)).toList();
    }

    if (sort != null) {
      result = sort(result);
    }

    return result;
  }
}
