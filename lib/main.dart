import 'package:flutter/material.dart';
import 'package:rick_morty_api_v2/views/home_screen.dart';
import 'package:rick_morty_api_v2/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/homepage': (context) => const HomeScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
