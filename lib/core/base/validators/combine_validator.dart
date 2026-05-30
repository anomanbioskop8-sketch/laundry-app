typedef Validator = String? Function(String? value);

class CombineValidator {
  static String? validate(List<Validator> validators, String? value) {
    for (final validator in validators) {
      final result = validator(value);

      if (result != null) {
        return result;
      }
    }

    return null;
  }
}
