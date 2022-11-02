import 'package:flutter/material.dart';

class MyInputForm extends StatefulWidget {
  const MyInputForm({super.key, required this.width});

  final double width;

  @override
  State<MyInputForm> createState() => _MyInputFormState();
}

class _MyInputFormState extends State<MyInputForm> {
  final _formKey = GlobalKey<FormState>();

  static const double _hPadding = 10.0;
  static const double _vPadding = 5.0;

  String? numbersValidator(String? value) {
    if (value == null || value.isEmpty || num.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (int.tryParse(value) == null) {
      return 'The number must be an integer';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double availableWidth = widget.width - _hPadding;

    return Container(
      width: widget.width,
      padding: const EdgeInsets.symmetric(
        horizontal: _hPadding,
        vertical: _vPadding,
      ),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            SizedBox(
              width: availableWidth * .60,
              child: TextFormField(
                validator: numbersValidator,
                maxLength: 4,
                decoration: const InputDecoration(
                  labelText: 'Enter your number',
                ),
              ),
            ),
            SizedBox(
              width: availableWidth * .05,
            ),
            SizedBox(
              width: availableWidth * .30,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text("Go"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
