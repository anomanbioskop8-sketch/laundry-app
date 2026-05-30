import 'combine_validator.dart';
import 'email_validator.dart';
import 'length_validator.dart';
import 'password_validator.dart';
import 'phone_validator.dart';
import 'required_validator.dart';

class AppValidator {
  static final required = RequiredValidator.validate;

  static final requiredCollection = RequiredValidator.collection;

  static final email = EmailValidator.validate;

  static final password = PasswordValidator.validate;

  static final confirmPassword = PasswordValidator.confirm;

  static final strongPassword = PasswordValidator.strong;

  static final phone = PhoneValidator.validate;

  static final combine = CombineValidator.validate;

  static final minLength = LengthValidator.min;
}
