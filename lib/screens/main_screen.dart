import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculation.dart';
import 'package:flutter_application_1/screens/result_screen.dart';
import 'package:flutter_application_1/widgets/main/checkBox/check_box.dart';
import 'package:flutter_application_1/widgets/main/container/gender.dart';
import 'package:flutter_application_1/widgets/main/input/input.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const TextStyle labelStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  String errorMessage = "";
  bool mIsChecked = false;
  bool fIsChecked = false;
  int age = 0;
  int height = 0;
  int weight = 0;

  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  // Fix
  int handleConvertStringToInt(String text) {
    var converted = int.parse(text);
    return converted;
  }

  // Fix
  String handleCalculate(
      bool mCheck, bool fCheck, String age, String weight, String height) {
    if (mCheck || fCheck == true) {
      if (age != "" && weight != "" && height != "") {
        var weightConverted = handleConvertStringToInt(weight);
        var heightConverted = handleConvertStringToInt(height);

        Calculation calculate =
            Calculation(height: heightConverted, weight: weightConverted);

        setState(() {
          errorMessage = "";
        });

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(
                    bmiResult: calculate.calculateBMI(),
                    result: calculate.result(),
                    interpretation: calculate.getInterpretation(),
                  )),
        );
      } else {
        setState(() {
          errorMessage = "Please fill all the required blanks!";
        });
      }
    } else {
      setState(() {
        errorMessage = "Please select your gender!";
      });
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Gender",
              style: labelStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const GenderContainer(image: "assets/icons/girl-icon.png"),
                    const Text("Female"),
                    CheckBox(
                        value: fIsChecked,
                        change: (bool? value) {
                          setState(() {
                            if (mIsChecked == true) {
                              mIsChecked = false;
                            }
                            fIsChecked = value!;
                          });
                        }),
                  ],
                ),
                Column(
                  children: [
                    const GenderContainer(image: "assets/icons/boy-icon.png"),
                    const Text("Male"),
                    CheckBox(
                        value: mIsChecked,
                        change: (bool? value) {
                          setState(() {
                            if (fIsChecked == true) {
                              fIsChecked = false;
                            }
                            mIsChecked = value!;
                          });
                        }),
                  ],
                )
              ],
            ),
            InputField(
                textFieldController: ageController,
                hint: "Enter a age.",
                label: "Age"),
            InputField(
                textFieldController: heightController,
                hint: "Enter a height",
                label: "Height"),
            InputField(
                textFieldController: weightController,
                hint: "Enter a weight",
                label: "Weight"),
            const SizedBox(
              height: 28,
            ),
            Text(
              errorMessage,
              style: const TextStyle(fontSize: 16, color: Colors.red),
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
                var ageControllerString = ageController.text.toString();
                var weightControllerString = weightController.text.toString();
                var heightControllerString = heightController.text.toString();

                handleCalculate(mIsChecked, fIsChecked, ageControllerString,
                    weightControllerString, heightControllerString);
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
