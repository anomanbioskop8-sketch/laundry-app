// =============================================================================
// File        : failure.dart
// Path        : lib/core/error/failure.dart
// Layer       : Core (Domain Error Representation)
// -----------------------------------------------------------------------------
// Fungsi:
// - Representasi error di Domain Layer
// - Hasil mapping dari AppException (Data Layer)
//
// Catatan:
// - Tidak bergantung pada framework / datasource
// - Digunakan oleh UseCase & UI
// =============================================================================

/// =========================
/// BASE FAILURE
/// =========================
abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => '$runtimeType(message: $message)';
}

/// =========================
/// AUTH / SESSION
/// =========================
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// =========================
/// NETWORK / SYSTEM
/// =========================
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

/// =========================
/// BUSINESS / DOMAIN
/// =========================
class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

/// =========================
/// VALIDATION & CONFLICT
/// =========================

/// Error input user (form validation)
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Error bentrok data (duplicate / state conflict)
class ConflictFailure extends Failure {
  const ConflictFailure(super.message);
}
