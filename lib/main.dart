import 'package:flutter/material.dart';
import "money_box.dart";
import 'package:http/http.dart' as http;
import 'info_pokemon.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.green,
);

void main() {
  const app = MyApp();
  runApp(app);
}

// สร้าง widget
// stateless widget : ไม่สามารถเปลี่ยนแปลงค่าได้
// stateful widget : สามารถเปลี่ยนแปลงค่าได้ / ทำงานหลาย state
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // การแสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: const MyHomePage(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.orange),
          scaffoldBackgroundColor: Colors.white),
    );
  }
}

// stateful
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;

  // InfoPokemon _dataFromAPI = infoPokemonFromJson();

  @override
  void initState() {
    super.initState();
    getInfoPokemon();
  }

  Future<void> getInfoPokemon() async {
    // ignore: avoid_print
    var url = "https://pokeapi.co/api/v2/pokemon/";
    var response = await http.get(Uri.parse(url));
    // _dataFromAPI = infoPokemonFromJson(response.body);

    // ignore: avoid_print
    print(response.body);
  }

  // แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    return Scaffold(
      appBar: AppBar(
        title: const Text("ข้อมูล Pokemon "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "$number",
              style: const TextStyle(fontSize: 30),
            ),
            const MoneyBox(
                title: "ยอดเงินคงเหลือ",
                amount: 15000,
                color: Colors.amber,
                size: 100),
            const SizedBox(
              height: 5,
            ),
            const MoneyBox(
                title: "รายรับ", amount: 30000, color: Colors.green, size: 100),
            const SizedBox(
              height: 5,
            ),
            const MoneyBox(
                title: "รายจ่าย",
                amount: 2000.855,
                color: Colors.red,
                size: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number++;
          });
        },
      ),
    );
  }
}
