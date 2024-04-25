import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.blue),
          scaffoldBackgroundColor: Colors.white),
      home: const MainScreen(),
    );
  }
}
