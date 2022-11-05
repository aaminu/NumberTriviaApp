import 'package:flutter/material.dart';

class ResultViewer extends StatelessWidget {
  ResultViewer(
    this.inputNumber, {
    super.key,
    required this.text,
    required this.index,
  });

  final int index;
  final String? inputNumber;
  final String text;

  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(16);
  final double _margin = 16.0;
  final double _padding = 16.0;
  final double _borderwidth = 2.0;
  final double _fontSize = 22.0;
  final List<String> _list = [
    ">>>>>>>>>>>>>o<<<<<<<<<<<<<",
    "~~~~~~~~~~~~~o~~~~~~~~~~~~~"
  ];

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Theme.of(context).colorScheme.primary,
      Colors.white,
      Theme.of(context).colorScheme.primary,
    ];

    return AnimatedContainer(
      margin: EdgeInsets.all(_margin),
      padding: EdgeInsets.all(_padding),
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: color[index],
        borderRadius: _borderRadius,
        border: Border.all(
          color: color[0],
          width: _borderwidth,
        ),
      ),
      child: Column(
        children: [
          if (inputNumber != null)
            Container(
              padding: EdgeInsets.all(_padding),
              decoration: BoxDecoration(
                  color: color[index + 1], shape: BoxShape.circle),
              child: Text(
                inputNumber!,
                style: TextStyle(
                    color: color[index],
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              color: color[index + 1],
              fontSize: _fontSize - 4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            _list[index],
            style: TextStyle(
              color: color[index + 1],
              fontSize: _fontSize - 7,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
