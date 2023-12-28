import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import '../../Model/Word.dart';
import '../../Service/Word_Service.dart';
import '../../main.dart';
import '../../provider/card_provider.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery
          .of(context)
          .size;
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
      provider.resetUsers();
    });
  }
  bool isButtonDisabled=false;
  void press() {
    if (!isButtonDisabled) {
      // Butona tıklandığında sayaç başlatılır
      setState(() {
        isButtonDisabled = true;
      });

      // 5 dakika (300 saniye) süresince sayaç devam eder
      Timer(Duration(minutes: 5), () {
        setState(() {
          isButtonDisabled = false;
        });
      });
    }
  }
  wordservice wordser= wordservice();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            ElevatedButton(

              onPressed: () {
                Get.to(()=>MainPage(),);
                // Butona tıklandığında yapılacak işlemler
              },
              style: ElevatedButton.styleFrom(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Kenar yuvarlaklığı ayarlayın
                ),
                minimumSize: Size(200, 70),
                primary: Colors.black, // Buton rengini siyah yapar
              ),
              child: Text('Start', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: ()  async {
               await wordser.ChatgptWords(widget.wordk);
               provider.resetUsers();
            },
            backgroundColor: Colors.green, // Floating action button rengini siyah yapar
            child: Icon(Icons.record_voice_over_sharp, color: Colors.white),
          ),
          SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              Get.to(() => GoogleTranslate(),arguments: widget.wordk);
            },
            backgroundColor: Colors.black, // Floating action button rengini siyah yapar
            child: Icon(Icons.add, color: Colors.white),
          ),
          SizedBox(height: 5,),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}