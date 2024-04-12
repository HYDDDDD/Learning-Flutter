import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({super.key, required this.value, required this.change});

  final bool value;
  final void Function(bool?)? change;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.green,
        value: value,
        onChanged: change,
      ),
    );
  }
}
