abstract class Either<L, R> {
  const Either();

  // =========================
  // FOLD
  // =========================

  T fold<T>(T Function(L failure) onLeft, T Function(R data) onRight);

  // =========================
  // STATE
  // =========================

  bool get isLeft => this is Left<L, R>;

  bool get isRight => this is Right<L, R>;

  bool get isFailure => isLeft;

  bool get isSuccess => isRight;

  // =========================
  // VALUE
  // =========================

  L? get left {
    if (this is Left<L, R>) {
      return (this as Left<L, R>).value;
    }

    return null;
  }

  R? get right {
    if (this is Right<L, R>) {
      return (this as Right<L, R>).value;
    }

    return null;
  }
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  T fold<T>(T Function(L failure) onLeft, T Function(R data) onRight) {
    return onLeft(value);
  }
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  T fold<T>(T Function(L failure) onLeft, T Function(R data) onRight) {
    return onRight(value);
  }
}
