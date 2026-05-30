extension StringExt on String {
  int get toIntOrZero {
    return int.tryParse(trim()) ?? 0;
  }

  double get toDoubleOrZero {
    return double.tryParse(trim()) ?? 0;
  }

  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => trim().isNotEmpty;
}
