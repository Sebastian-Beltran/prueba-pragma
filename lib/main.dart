// ignore_for_file: avoid_print

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/features/home/ui/detail_screen.dart';
import 'package:prueba_pragma/features/home/ui/home_screen.dart';

Future<void> main() async {
  runZonedGuarded<void>(() async {
    EquatableConfig.stringify = true;
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) {
    print(error.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App salud',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF213544),
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF213544),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailsScreen(),
      },
    );
  }
}
