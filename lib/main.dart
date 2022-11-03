import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_page.dart';
import './providers/numbers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Numbers(),
      child: MaterialApp(
        title: 'Numbers Trivia App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 12, 102, 176),
            secondary: const Color.fromARGB(255, 8, 65, 112),
            background: const Color.fromARGB(255, 205, 195, 225),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
