class AutoFormEngine {
  final Map<String, dynamic> values = {};

  void set(String key, dynamic value) {
    values[key] = value;
  }

  T build<T>(T Function(Map<String, dynamic>) mapper) {
    return mapper(values);
  }
}
