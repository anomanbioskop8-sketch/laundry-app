abstract class BaseState<T> {
  const BaseState();
}

/// Initial
class BaseInitial<T> extends BaseState<T> {}

/// Loading
class BaseLoading<T> extends BaseState<T> {}

/// Success (single / list)
class BaseSuccess<T> extends BaseState<T> {
  final T data;

  const BaseSuccess(this.data);
}

/// Empty (khusus list)
class BaseEmpty<T> extends BaseState<T> {}

/// Error
class BaseError<T> extends BaseState<T> {
  final String message;

  const BaseError(this.message);
}
