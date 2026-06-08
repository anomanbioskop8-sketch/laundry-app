class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }

    return null;
  }

  static String? strong(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$');

    if (!regex.hasMatch(value)) {
      return 'Password harus ada huruf besar, kecil, dan angka';
    }

    return null;
  }

  static String? confirm(String? value, String? original) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi password wajib diisi';
    }

    if (value != original) {
      return 'Konfirmasi password tidak sama dengan password';
    }

    return null;
  }
}
