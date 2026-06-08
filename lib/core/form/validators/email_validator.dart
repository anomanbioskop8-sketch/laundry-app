class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }

    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

    if (!regex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    return null;
  }
}
