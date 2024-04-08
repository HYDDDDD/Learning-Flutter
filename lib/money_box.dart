import 'package:flutter/material.dart';
import "package:intl/intl.dart";

// สร้าง Container ต้นแบบเอาไว้
class MoneyBox extends StatelessWidget {
  const MoneyBox({
    super.key,
    required this.title,
    required this.amount,
    required this.color,
    required this.size,
  });

  final String title;
  final double amount;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(10)), //สำหรับกำหนดรูปร่างของ Container
      height: size,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              NumberFormat("#,###.##").format(amount),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
