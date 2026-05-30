class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  bool get isValid =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;
}
