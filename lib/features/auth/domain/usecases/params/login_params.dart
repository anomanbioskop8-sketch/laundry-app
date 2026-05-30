/// =========================
/// CREATE CUSTOMER
/// =========================
class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  bool get isValid => email.isNotEmpty && password.isNotEmpty;
}
