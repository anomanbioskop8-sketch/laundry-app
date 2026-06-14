abstract interface class LoggerService {
  void debug(String message);

  void info(String message);

  void warning(String message);

  void error(Object error, {StackTrace? stackTrace, String? message});

  void fatal(Object error, {StackTrace? stackTrace, String? message});
}
