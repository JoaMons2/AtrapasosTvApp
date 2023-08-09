import 'package:flutter/material.dart';
import 'package:kc_tv_app/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atrapados TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        primaryColor: Color.fromARGB(255, 18, 82, 114),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 28, 82, 176),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica'),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica'),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica'),
            ),

        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}


