import 'dart:developer';

import 'package:flutter/material.dart';
import 'food_menu.dart';

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
  // State
  int number = 0;

  // Event
  void increment() {
    // การเปลี่ยนแปลงค่า state
    setState(() {
      number++;
    });
  }

  //List<Widget> : เป็นการ return type List<Widget>
  List<Widget> getData(int count) {
    // กลุ่มข้อมูล Text widget
    List<Widget> data = [];
    for (var i = 0; i < count; i++) {
      var menu = ListTile(
        title: Text("เมนูที่ ${i + 1}"),
        subtitle: Text("หัวข้อย่อยที่ ${i + 1}"),
      );
      data.add(menu);
    }

    return data;
  }

  // Create List type FoodMenu to store FoodMenu objects.
  List<FoodMenu> listFoodMenu = [
    FoodMenu("กะเพราหมูสับ", 45, "assets/images/pexels-photo-12100417.jpeg"),
    FoodMenu("ผัดไท", 80, "assets/images/pexels-photo-12561883.webp"),
    FoodMenu("ข้าวผัด", 45, "assets/images/pexels-photo-723198.webp"),
    FoodMenu("ก๋วยเตี๋ยวต้มยำ", 55, "assets/images/pexels-photo-699953.webp")
  ];

  // แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    // Create List widget
    List<Widget> listData = [];

    // Add widget in List widget
    listData.add(const Text("Test List widget!"));

    listData.add(const Text("Try loop"));
    for (var i = 0; i < 10; i++) {
      listData.add(Text("รายการที่ ${i + 1}"));
    }

    listData.add(const Text(
      "This is a number",
      style: TextStyle(fontSize: 30, color: Colors.white),
    ));
    listData.add(Text(
      number.toString(),
      style: const TextStyle(fontSize: 60, color: Colors.white),
    ));
    listData.add(const Image(
        image: NetworkImage(
            "https://i.pinimg.com/originals/31/a6/cf/31a6cffaef30fd4d8420da1bc9c0eda1.png")));

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: Center(
        // child: Column(
        //   mainAxisAlignment:
        //       MainAxisAlignment.center, //กำหนด position ใน column
        //   children: listData, //Call List Widget
        // ),

        // child: ListView(
        //   children: getData(20), // Call function
        // ),

        // Create List ขนาดใหญ่ ที่มี children มาก หรือไม่มีสิ้นสุด
        child: ListView.builder(
            itemCount: listFoodMenu.length,
            itemBuilder: (BuildContext context, int index) {
              FoodMenu food = listFoodMenu[index];

              return ListTile(
                leading: Image.asset(
                  food.image,
                  width: 120,
                  fit: BoxFit.cover,
                ), // ระบุ images
                title: Text(
                  food.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("ราคา ${food.price} บาท"),
                onTap: () {
                  // print("คุณเลือกเมนูอาหารชื่อว่า");
                  // ignore: avoid_print
                  print("คุณเลือกเมนูอาหารที่ชื่อว่า : ${food.name}");
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
