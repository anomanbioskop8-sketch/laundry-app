import 'package:app_laundry/core/di/injection.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/core/theme/core_theme.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customers/presentation/pages/customer_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await initializeDateFormatting('id_ID');

  await init();

  WidgetsFlutterBinding.ensureInitialized();

  // --------------------------------------------------------------------------
  // Init Firebase
  // --------------------------------------------------------------------------
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCbpDpfwmyG99lDah-9gkh1qkVewULgA7w",
      authDomain: "kasirlaundry-87ef6.firebaseapp.com",
      projectId: "kasirlaundry-87ef6",
      storageBucket: "kasirlaundry-87ef6.appspot.com",
      messagingSenderId: "726441484292",
      appId: "1:726441484292:web:03c24940e97783af731551",
      measurementId: "G-QVBVVY91CR",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CoreTheme.light(),
      darkTheme: CoreTheme.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      locale: const Locale('id', 'ID'),
      supportedLocales: const [Locale('id', 'ID'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      scaffoldMessengerKey: AppNavigator.messengerKey,
      navigatorKey: AppNavigator.navigatorKey,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<CustomerCubit>()..listen('202603202155396483'),
          ),
          BlocProvider(create: (_) => getIt<CustomerActionCubit>()),
        ],
        child: CustomerListPage(companyId: '202603202155396483'),
      ),
    );
  }
}
