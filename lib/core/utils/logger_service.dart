import 'package:logging/logging.dart';

abstract class LoggerService {
  void debug(String message);
  void info(String message);
  void warning(String message);
  void error(Object error, StackTrace stackTrace);
}

class AppLogger implements LoggerService {
  final Logger _logger = Logger('AppLogger');

  AppLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      // output format global
      // ignore: avoid_print
      print('[${record.level.name}] ${record.time}: ${record.message}');
    });
  }

  @override
  void debug(String message) {
    _logger.fine(message);
  }

  @override
  void info(String message) {
    _logger.info(message);
  }

  @override
  void warning(String message) {
    _logger.warning(message);
  }

  @override
  void error(Object error, StackTrace stackTrace) {
    _logger.severe(error.toString(), error, stackTrace);
  }
}
