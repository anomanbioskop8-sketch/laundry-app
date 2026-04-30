class AppValidator {
  /// =========================
  /// REQUIRED
  /// =========================
  static String? required(String? value, {String field = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$field wajib diisi';
    }
    return null;
  }

  /// =========================
  /// EMAIL
  /// =========================
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    return null;
  }

  /// =========================
  /// PASSWORD
  /// =========================
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }

    return null;
  }

  /// 🔥 OPTIONAL (STRONG PASSWORD)
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$');

    if (!regex.hasMatch(value)) {
      return 'Password harus ada huruf besar, kecil, dan angka (min 8 karakter)';
    }

    return null;
  }

  /// =========================
  /// PHONE
  /// =========================
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor HP wajib diisi';
    }

    final phoneRegex = RegExp(r'^[0-9]{8,15}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Nomor HP tidak valid';
    }

    return null;
  }

  /// =========================
  /// MIN LENGTH
  /// =========================
  static String? minLength(String? value, int min, {String field = 'Field'}) {
    if (value == null || value.length < min) {
      return '$field minimal $min karakter';
    }
    return null;
  }

  /// =========================
  /// COMBINE VALIDATOR
  /// =========================
  static String? combine(
    List<String? Function(String?)> validators,
    String? value,
  ) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) return result;
    }
    return null;
  }
}
