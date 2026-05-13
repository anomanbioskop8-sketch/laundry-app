// =============================================================================
// File        : map_list_ext.dart
// Path        : lib/core/extensions/map_list_ext.dart
// =============================================================================

extension MapListX on Map<String, dynamic> {
  List<T> toModelList<T>(
    String key,
    T Function(Map<String, dynamic> map) fromMap,
  ) {
    return List<Map<String, dynamic>>.from(
      this[key] ?? [],
    ).map(fromMap).toList();
  }
}
