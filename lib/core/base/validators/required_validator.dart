class RequiredValidator {
  static String? validate(
    String? value, {
    String message = 'Field wajib diisi',
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }

    return null;
  }

  static String? collection(
    Iterable<dynamic>? items, {
    String message = 'Data wajib diisi',
  }) {
    if (items == null || items.isEmpty) {
      return message;
    }

    return null;
  }
}
