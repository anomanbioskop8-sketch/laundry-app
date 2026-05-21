import 'package:app_laundry/core/utils/logger_service.dart';
import 'package:get_it/get_it.dart';

void registerLogger(GetIt sl) {
  sl.registerLazySingleton<LoggerService>(() => AppLogger());
}
