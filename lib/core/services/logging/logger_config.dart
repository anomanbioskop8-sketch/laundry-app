import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerConfig {
  const LoggerConfig._();

  static Logger build() {
    return Logger(
      level: kDebugMode ? Level.debug : Level.info,
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );
  }
}
