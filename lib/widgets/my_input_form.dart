import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/numbers.dart';

class MyInputForm extends StatefulWidget {
  const MyInputForm({super.key, required this.width});

  final double width;

  @override
  State<MyInputForm> createState() => _MyInputFormState();
}

class _MyInputFormState extends State<MyInputForm> {
  static const double _hPadding = 10.0;
  static const double _vPadding = 5.0;
  final _formKey = GlobalKey<FormState>();
  final _myController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  String? numbersValidator(String? value) {
    if (value == null || value.isEmpty || num.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (int.tryParse(value) == null) {
      return 'The number must be an integer';
    }

    return null;
  }

  Future<void> buttonPressed(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Numbers>(context, listen: false)
          .getNumber(_myController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Request failed, please try again 😣",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double availableWidth = widget.width - _hPadding;

    return Container(
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
                controller: _myController,
                keyboardType: TextInputType.number,
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
            _isLoading
                ? Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                : SizedBox(
                    width: availableWidth * .30,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          buttonPressed(context);
                          _formKey.currentState!.reset();
                        }
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
