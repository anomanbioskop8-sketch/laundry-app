// =============================================================================
// File        : either.dart
// Path        : core/common/either.dart
// Layer       : Core (Functional Utility)
// -----------------------------------------------------------------------------
// Fungsi:
// - Representasi hasil operasi yang bisa sukses atau gagal
// - Menghindari penggunaan exception untuk flow normal
// - Digunakan pada UseCase / Repository layer
//
// Struktur:
// - Left  → Failure (error / exception / AppException)
// - Right → Success (data hasil operasi)
// =============================================================================

/// =========================
/// Either BASE CLASS
/// =========================
///
/// Representasi nilai yang bisa berupa:
/// - Left  = Failure
/// - Right = Success
abstract class Either<L, R> {
  const Either();

  /// =========================
  /// FOLD
  /// =========================
  ///
  /// Pattern matching untuk menangani kedua kemungkinan:
  /// - onLeft  → ketika failure
  /// - onRight → ketika success
  T fold<T>(T Function(L failure) onLeft, T Function(R data) onRight);

  /// =========================
  /// STATE CHECK
  /// =========================

  /// true jika hasil adalah failure (Left)
  bool get isLeft => this is Left<L, R>;

  /// true jika hasil adalah success (Right)
  bool get isRight => this is Right<L, R>;

  /// alias dari isLeft
  bool get isFailure => isLeft;

  /// alias dari isRight
  bool get isSuccess => isRight;

  /// =========================
  /// VALUE ACCESS
  /// =========================

  /// ambil value jika Left, jika tidak null
  L? get left {
    if (this is Left<L, R>) {
      return (this as Left<L, R>).value;
    }
    return null;
  }

  /// ambil value jika Right, jika tidak null
  R? get right {
    if (this is Right<L, R>) {
      return (this as Right<L, R>).value;
    }
    return null;
  }
}

/// =========================
/// LEFT (FAILURE)
// =========================
///
/// Menyimpan error / failure state
class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  T fold<T>(T Function(L failure) onLeft, T Function(R data) onRight) {
    return onLeft(value);
  }
}

/// =========================
/// RIGHT (SUCCESS)
// =========================
///
/// Menyimpan data sukses
class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  T fold<T>(T Function(L failure) onLeft, T Function(R data) onRight) {
    return onRight(value);
  }
}
