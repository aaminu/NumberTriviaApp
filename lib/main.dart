import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_page.dart';
import './providers/numbers.dart';
import './providers/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SettingsProvider settingsProvider = SettingsProvider();

  Future<void> fetchSettings() async {
    await settingsProvider.getColorInt();
    await settingsProvider.getHistoryCount();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialAppWidget(settingsProvider: settingsProvider);
        }
        return Container(
          color: Colors.white,
          child: const Center(
              child: CircularProgressIndicator(
            color: Color(0xFF0C66B0),
          )),
        );
      },
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    Key? key,
    required this.settingsProvider,
  }) : super(key: key);

  final SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Numbers(),
        ),
        ChangeNotifierProvider(
          create: (_) => settingsProvider,
        )
      ],
      child: Consumer<SettingsProvider>(
        builder: (context, settings, child) => MaterialApp(
          title: 'Numbers Trivia App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: settings.colorValue,
              secondary: const Color.fromARGB(255, 8, 65, 112),
              background: const Color.fromARGB(255, 205, 195, 225),
            ),
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
