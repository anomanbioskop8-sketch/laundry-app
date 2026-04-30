/// =========================
/// CREATE CUSTOMER
/// =========================
class LoginParams {
  final String email;
  final String pass;

  const LoginParams({required this.email, required this.pass});

  bool get isValid => email.isNotEmpty && pass.isNotEmpty;
}
