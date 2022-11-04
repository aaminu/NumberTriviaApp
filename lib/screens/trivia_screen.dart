import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/my_input_form.dart';
import '../providers/numbers.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Trivia Home"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * .20,
              child: MyInputForm(
                width: width,
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Consumer<Numbers>(
              builder: (ctx, value, _) {
                return value.result == null
                    ? const Text(
                        "Hey you, what trivia will you learn today? Enter a number to get started")
                    : Text(value.result as String);
              },
            )
          ],
        ),
      ),
    );
  }
}
