import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.textFieldController,
      required this.hint,
      required this.label});

  final TextEditingController textFieldController;
  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textFieldController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.blue.shade800, fontWeight: FontWeight.bold),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
