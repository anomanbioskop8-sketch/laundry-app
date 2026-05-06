// =============================================================================
// File        : failure_mapper.dart
// Path        : lib/core/error/mappers/failure_mapper.dart
// Layer       : Core (Error Mapping)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengubah AppException (Data Layer) → Failure (Domain Layer)
//
// Catatan:
// - Mapping harus 1:1 dengan ExceptionType
// - Default fallback ke UnknownFailure untuk keamanan
// =============================================================================

import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';

class FailureMapper {
  const FailureMapper._(); // 🔒 prevent instantiation

  /// =========================
  /// MAP EXCEPTION → FAILURE
  /// =========================
  static Failure mapExceptionToFailure(AppException e) {
    switch (e.type) {
      case ExceptionType.server:
        return ServerFailure(e.message);

      case ExceptionType.network:
        return NetworkFailure(e.message);

      case ExceptionType.permission:
        return PermissionFailure(e.message);

      case ExceptionType.notFound:
        return NotFoundFailure(e.message);

      case ExceptionType.unauthorized:
        return UnauthorizedFailure(e.message);

      case ExceptionType.timeout:
        return TimeoutFailure(e.message);

      case ExceptionType.validation:
        return ValidationFailure(e.message);

      case ExceptionType.conflict:
        return ConflictFailure(e.message);

      case ExceptionType.unknown:
        return UnknownFailure(e.message);
    }
  }
}
