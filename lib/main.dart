import 'package:flutter/material.dart';
import 'home.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111428),
        ),
        primaryColor: const Color(0xFF111428),
        scaffoldBackgroundColor: const Color(0xFF111428),
      ),
      home: Home(),
      // routes: {
      //   '/': (context) => const Home(),
      //   '/result': (context) => const Result(),
      // },
    );
  }
}
