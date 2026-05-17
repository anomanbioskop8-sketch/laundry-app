import 'package:app_laundry/core/error/mappers/firebase_error_mapper.dart';
import 'package:app_laundry/core/error/exceptions.dart';

extension FirebaseExceptionX on Object {
  /// Convert exception apa pun menjadi AppException
  AppException get toAppException {
    return FirebaseErrorMapper.map(this);
  }

  /// Shortcut langsung ke message UI
  String get uiMessage {
    final exception = FirebaseErrorMapper.map(this);
    return exception.message;
  }
}
