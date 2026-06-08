class LengthValidator {
  static String? min(String? value, int min, {String field = 'Field'}) {
    if (value == null || value.length < min) {
      return '$field minimal $min karakter';
    }

    return null;
  }
}
