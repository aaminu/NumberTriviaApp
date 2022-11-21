import 'package:flutter/material.dart';
import '../widgets/theme_color_selector.dart';
import '../widgets/history_count_selector.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("App Settings"),
        ),
        body: ListView(
          children: const [
            SizedBox(),
            ThemeColorSelector(),
            Divider(),
            HistoryCountSelector(),
          ],
        ));
  }
}
