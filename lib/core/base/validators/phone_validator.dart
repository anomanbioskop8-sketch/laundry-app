class PhoneValidator {
  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor HP wajib diisi';
    }

    final regex = RegExp(r'^[0-9]{8,15}$');

    if (!regex.hasMatch(value)) {
      return 'Nomor HP tidak valid';
    }

    return null;
  }
}
