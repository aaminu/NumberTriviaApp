import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/numbers.dart';
import '../providers/settings.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final historyValue = Provider.of<Numbers>(context).history;
    final historyCount = Provider.of<Settings>(context).historyCount;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trivia History"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HistoryCard(
            id: historyValue[index][0],
            number: historyValue[index][1],
            text: historyValue[index][2],
          );
        },
        itemCount: min(historyCount, historyValue.length),
      ),
    );
  }
}
