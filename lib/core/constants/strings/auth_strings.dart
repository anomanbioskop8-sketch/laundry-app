// core/constants/auth_strings.dart

class AuthStrings {
  AuthStrings._();

  static const loginTitle = 'Login';
  static const registerTitle = 'Register';

  //=======================================
  // LABELS
  //=======================================

  static const emailLabel = 'Email';
  static const nameLabel = 'Nama';
  static const passwordLabel = 'Password';
  static const confirmPasswordLabel = 'Konfirmasi Password';

  //=======================================
  // HINTS
  //=======================================

  static const emailHint = 'Masukkan email';
  static const nameHint = 'Masukkan nama';
  static const passwordHint = 'Masukkan password';
  static const confirmPasswordHint = 'Konfirmasi password';

  static const loginHint = 'Sudah punya akun? Login';
  static const registerHint = 'Belum punya akun? Register';

  //=======================================
  // VALIDATION MESSAGES
  //=======================================

  static const nameRequired = 'Nama wajib diisi';

  //=======================================
  // MESSAGES
  //=======================================
  static const loginSuccess = 'Login berhasil';
  static const registerSuccess = 'Registrasi berhasil';
  static const noAccount = 'Belum punya akun?';
  static const alreadyHaveAccount = 'Sudah punya akun?';
  static const unknownError = 'Terjadi kesalahan tidak diketahui';
  static const userNotFound = 'User tidak ditemukan';
  static const wrongPassword = 'Password salah';
  static const invalidCredential = 'Email atau password tidak valid';
  static const emailAlreadyUsed = 'Email sudah digunakan';
  static const invalidEmail = 'Format email tidak valid';
  static const weakPassword = 'Password terlalu lemah';
  static const noInternet = 'Tidak ada koneksi internet';
  static const tooManyRequests = 'Terlalu banyak percobaan, coba lagi nanti';
  static const firebaseError = 'Terjadi kesalahan pada server';
}
