import 'package:get_it/get_it.dart';
import 'register_core.dart';
import 'register_features.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  await registerCore(sl);
  await registerFeatures(sl);
}
