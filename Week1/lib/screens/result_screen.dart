import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.bmiResult,
      required this.result,
      required this.interpretation});

  static Color bmiNormalStyle = Colors.green.shade300;
  static Color bmiDefectiveStyle = Colors.red.shade600;

  final String bmiResult;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 28,
            ),
            double.parse(bmiResult) > 18.5 && double.parse(bmiResult) < 25
                ? Image.asset(
                    "assets/icons/laughing-icon.png",
                    width: 208,
                  )
                : Image.asset(
                    "assets/icons/sad-icon.png",
                    width: 208,
                  ),
            const SizedBox(
              height: 28,
            ),
            const Text("Your BMI is",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(
              bmiResult,
              style:
                  double.parse(bmiResult) > 18.5 && double.parse(bmiResult) < 25
                      ? TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w900,
                          color: bmiNormalStyle,
                        )
                      : TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w900,
                          color: bmiDefectiveStyle),
            ),
            Text(
              result,
              style:
                  double.parse(bmiResult) > 18.5 && double.parse(bmiResult) < 25
                      ? TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: bmiNormalStyle,
                        )
                      : TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: bmiDefectiveStyle),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              interpretation,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 28,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(450, 45)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              child: const Text('Home'),
            ),
          ],
        )),
      ),
    );
  }
}
