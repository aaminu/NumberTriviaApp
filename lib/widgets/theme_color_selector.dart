import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../providers/settings.dart';

class ThemeColorSelector extends StatefulWidget {
  const ThemeColorSelector({super.key});

  @override
  State<ThemeColorSelector> createState() => _ThemeColorSelectorState();
}

class _ThemeColorSelectorState extends State<ThemeColorSelector> {
  late Color colorPicker;
  late Color currentColor;
  bool _isdeclared = false;

  @override
  void didChangeDependencies() {
    if (!_isdeclared) {
      colorPicker = Theme.of(context).colorScheme.primary;
      currentColor = Theme.of(context).colorScheme.primary;
    }
    _isdeclared = true;
    super.didChangeDependencies();
  }

  void changeColor(Color color) {
    setState(() {
      colorPicker = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        leading: const Icon(Icons.colorize),
        title: const Text("Theme Color"),
        trailing: GestureDetector(
          child: SizedBox(
            width: 30,
            child: Container(
                decoration: BoxDecoration(
                    color: currentColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26))),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Pick a color!'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: colorPicker,
                    onColorChanged: changeColor,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Got it'),
                    onPressed: () {
                      setState(() {
                        currentColor = colorPicker;
                        Provider.of<Settings>(context, listen: false)
                            .changeColor(colorPicker);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
