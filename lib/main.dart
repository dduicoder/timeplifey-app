import 'package:flutter/material.dart';

import 'package:timeplifey/pages/account_screen.dart';
import 'package:timeplifey/pages/notification_screen.dart';
import 'package:timeplifey/pages/settings_screen.dart';
import 'package:timeplifey/pages/main_screen/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Sanfrancisco",
        brightness: Brightness.light,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 100, 115, 230),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.25,
          ),
          color: Color.fromARGB(255, 100, 115, 230),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 100, 115, 230),
        ),
      ),
      routes: {
        "/": (_) => const TabsScreen(),
        NotificationScreen.routeName: (_) => const NotificationScreen(),
        AccountScreen.routeName: (_) => const AccountScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
    );
  }
}
