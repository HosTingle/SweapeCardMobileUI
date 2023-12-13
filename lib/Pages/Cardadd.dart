import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import '../Model/Word.dart';
import '../main.dart';
import '../provider/card_provider.dart';
import 'AddWordPage.dart';
class MyHomePage extends StatefulWidget {
  Words? wordk;

  MyHomePage({
    Key? key,
    required this.wordk,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final provider = Provider.of<CardProvider>(context,listen: false);
            provider.resetUsers();
            Get.to(MainPage(),);
            // Butona tıklandığında yapılacak işlemler
          },
          style: ElevatedButton.styleFrom(
            shape: LinearBorder(),
            minimumSize: Size(200, 70),
            primary: Colors.black, // Buton rengini siyah yapar
          ),
          child: Text('Başla', style: TextStyle(color: Colors.white)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => GoogleTranslate(),arguments: widget.wordk);
        },
        backgroundColor: Colors.black, // Floating action button rengini siyah yapar
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}