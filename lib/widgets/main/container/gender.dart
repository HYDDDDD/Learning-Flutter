import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(99)),
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(99),
        child: Image.asset(
          image,
          width: 80,
        ),
      ),
    );
  }
}
