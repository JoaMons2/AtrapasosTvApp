import 'package:flutter/material.dart';
import 'package:kc_tv_app/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    //Items _items = Items();
    return MaterialApp(
      title: 'Atrapados en el Tiempo TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:const Color.fromARGB(255, 0, 0, 0),
        primaryColor: const Color.fromARGB(255, 8, 45, 176),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tahoma',),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tahoma'),
            ),
        useMaterial3: true,
      ),
      home: const StartScreen(),
  //     routes: {
  //         //'/': (context) => const StartScreen(), // Esta es la ruta inicial
  //         'ListScreen': (context) => ListScreen( listItems: _items,), // Esta es la ruta que quieres usar
  // },
    );
  }
}


