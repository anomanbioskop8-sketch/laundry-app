import 'package:app_laundry/app/block/app_bloc_observer.dart';
import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/app_router.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/core/theme/core_theme.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID');

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

  await initDI();

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = sl<AuthCubit>()..checkAuth();

    final router = AppRouter(authCubit).router;

    return MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>.value(value: authCubit)],
      child: MaterialApp.router(
        title: 'Laundry SaaS App',
        theme: CoreTheme.light(),
        darkTheme: CoreTheme.dark(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        locale: const Locale('id', 'ID'),
        supportedLocales: const [Locale('id', 'ID'), Locale('en', 'US')],

        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        scaffoldMessengerKey: AppNavigator.messengerKey,
        //navigatorKey: AppNavigator.navigatorKey,
      ),
    );
  }
}
