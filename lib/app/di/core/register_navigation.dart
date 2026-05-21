import 'package:app_laundry/app/router/navigation_service.dart';
import 'package:get_it/get_it.dart';

void registerNavigation(GetIt sl) {
  sl.registerLazySingleton<NavigationService>(() => NavigationService(sl()));
}
