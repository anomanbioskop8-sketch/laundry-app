import 'package:app_laundry/core/services/logging/logger_config.dart';
import 'package:app_laundry/core/services/logging/logger_service.dart';
import 'package:logger/logger.dart';

class AppLogger implements LoggerService {
  AppLogger({Logger? logger}) : _logger = logger ?? LoggerConfig.build();

  final Logger _logger;

  @override
  void debug(String message) {
    _logger.d(message);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }

  @override
  void warning(String message) {
    _logger.w(message);
  }

  @override
  void error(Object error, {StackTrace? stackTrace, String? message}) {
    _logger.e(
      message ?? error.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void fatal(Object error, {StackTrace? stackTrace, String? message}) {
    _logger.f(
      message ?? error.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
