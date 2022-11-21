import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/settings.dart';

class HistoryCountSelector extends StatefulWidget {
  const HistoryCountSelector({super.key});

  @override
  State<HistoryCountSelector> createState() => _HistoryCountSelectorState();
}

class _HistoryCountSelectorState extends State<HistoryCountSelector> {
  bool _isdeclared = false;
  late int _dropdownValue;

  @override
  void didChangeDependencies() {
    if (!_isdeclared) {
      _dropdownValue =
          Provider.of<Settings>(context, listen: false).historyCount;
    }

    _isdeclared = true;
    super.didChangeDependencies();
  }

  void updateHistoryCount(BuildContext context, int? value) {
    setState(() {
      _dropdownValue = value as int;
      Provider.of<Settings>(context, listen: false).changeHistoryCount(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
          leading: const Icon(Icons.history),
          title: const Text("History count"),
          trailing: DropdownButton(
            items: const [
              DropdownMenuItem<int>(value: 5, child: Text("5")),
              DropdownMenuItem<int>(value: 10, child: Text("10")),
              DropdownMenuItem<int>(value: 15, child: Text("15")),
              DropdownMenuItem<int>(value: 20, child: Text("20")),
              DropdownMenuItem<int>(value: 25, child: Text("25")),
            ],
            value: _dropdownValue,
            onChanged: (value) => updateHistoryCount(context, value),
          )),
    );
  }
}
