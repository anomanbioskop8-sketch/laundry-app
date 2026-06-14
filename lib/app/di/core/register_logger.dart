import 'package:app_laundry/core/services/logging/app_logger.dart';
import 'package:app_laundry/core/services/logging/logger_service.dart';
import 'package:get_it/get_it.dart';

void registerLogger(GetIt sl) {
  sl.registerLazySingleton<LoggerService>(AppLogger.new);
}
