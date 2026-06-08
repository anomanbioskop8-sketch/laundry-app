// =============================================================================
// File        : main.dart
// Path        : lib/main.dart
// Layer       : App Entry Point
// -----------------------------------------------------------------------------
// Fungsi:
// - Inisialisasi Firebase
// - Inisialisasi Dependency Injection
// - Inisialisasi Session (auto login)
// - Setup Router & Theme
// =============================================================================

import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/app_router.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/base/action/base_action_cubit.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/core/theme/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
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
  final router = AppRouter().router;
  runApp(MyApp(router: router));
}

// =============================================================================
// APP
// =============================================================================

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<SessionCubit>()),
        BlocProvider(create: (_) => sl<BaseActionCubit>()),
      ],

      child: MaterialApp.router(
        title: 'Laundry SaaS App',
        theme: AppThemes.light(),
        //darkTheme: AppThemes.dark(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        locale: const Locale('id', 'ID'),
        supportedLocales: const [Locale('id', 'ID'), Locale('en', 'US')],
        scaffoldMessengerKey: AppNavigator.messengerKey,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
