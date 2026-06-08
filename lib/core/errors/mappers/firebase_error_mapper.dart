// =============================================================================
// File        : firebase_error_mapper.dart
// Path        : lib/core/error/mappers/firebase_error_mapper.dart
// Layer       : Core (Error Handling)
// -----------------------------------------------------------------------------

import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_laundry/core/constants/strings/auth_strings.dart';

class FirebaseErrorMapper {
  /// =========================
  /// MAIN MAPPER
  /// =========================
  static AppException map(Object error) {
    if (error is FirebaseAuthException) {
      return _mapAuthError(error);
    }

    return UnknownException(AuthStrings.unknownError);
  }

  /// =========================
  /// AUTH ERROR MAPPER
  /// =========================
  static AppException _mapAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return const NotFoundException(AuthStrings.userNotFound);

      case 'wrong-password':
        return const PermissionException(AuthStrings.wrongPassword);

      case 'invalid-credential':

        /// 🔥 Tambahan penting (Firebase terbaru sering pakai ini)
        return const PermissionException(AuthStrings.invalidCredential);

      case 'email-already-in-use':
        return const ConflictException(AuthStrings.emailAlreadyUsed);

      case 'invalid-email':
        return const ValidationException(AuthStrings.invalidEmail);

      case 'weak-password':
        return const ValidationException(AuthStrings.weakPassword);

      case 'network-request-failed':
        return const NetworkException(AuthStrings.noInternet);

      case 'too-many-requests':
        return const PermissionException(AuthStrings.tooManyRequests);

      default:
        return ServerException(error.message ?? AuthStrings.firebaseError);
    }
  }
}
