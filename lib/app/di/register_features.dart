import 'package:app_laundry/app/di/module/auth_module.dart';
import 'package:app_laundry/app/di/module/customer_module.dart';
import 'package:app_laundry/app/di/module/laundry_item_module.dart';
import 'package:app_laundry/app/di/module/laundry_price_module.dart';
import 'package:get_it/get_it.dart';

Future<void> registerFeatures(GetIt sl) async {
  await AuthModule(sl).init();
  await CustomerModule(sl).init();
  await LaundryItemModule(sl).init();
  await LaundryPriceModule(sl).init();
  // await OrderModule(sl).init();
}
