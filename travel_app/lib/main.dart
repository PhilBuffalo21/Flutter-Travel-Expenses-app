import 'package:flutter/material.dart';
import 'package:travel_app/expense_controller.dart';

var lightTheme =
    ColorScheme.fromSeed(seedColor: const Color.fromRGBO(228, 153, 154, 100));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          colorScheme: lightTheme,
          appBarTheme: AppBarTheme(
              backgroundColor: lightTheme.onPrimaryContainer,
              foregroundColor: lightTheme.onPrimary),
          cardTheme: const CardTheme().copyWith(
              color: lightTheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: lightTheme.secondaryContainer,
                foregroundColor: lightTheme.secondary),
          ),
          textTheme: const TextTheme().copyWith(
              titleLarge: TextStyle(
                  fontSize: 25,
                  color: lightTheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold),
              bodySmall:
                  TextStyle(fontSize: 15, color: lightTheme.onPrimaryContainer),
              headlineMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: lightTheme.onPrimaryContainer),
              headlineSmall: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: lightTheme.onPrimaryContainer))),
      home: Controller(),
    );
  }
}
