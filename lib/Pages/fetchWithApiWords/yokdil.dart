import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/Webword.dart';
import '../../Model/Word.dart';
import '../../Service/Word_Service.dart';
import '../../Service/yokdil_service.dart';
import '../../provider/card_provider.dart';


class YokdilPage extends StatefulWidget {
  const YokdilPage({super.key});

  @override
  State<YokdilPage> createState() => _YokdilPageState();
}

class _YokdilPageState extends State<YokdilPage> {
  String text2 = '';
  String text1="";
  int? dada;
  @override
  void initState() {
    super.initState();
    sharedpref();
  }
  Future<void> sharedpref() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    dada=sharedPreferences.getInt("userId");
  }
  bool? isLoading;
  YokdilService _service = YokdilService();
  List<Word> articles = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context,listen: false);
    final Words receivedData = Get.arguments;
    void _submitForm() {
      receivedData.userId = dada;
      receivedData.firstWord  = text1;
      receivedData.secondWord  = text2;
      receivedData.languageId=1;
      receivedData.showCounter=0;
      receivedData.sentence="";
    }
    wordservice wordser= wordservice();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                leading: IconButton(onPressed: () { Get.back();provider.resetUsers();}, icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
              ),
              body: FutureBuilder<List<Word>>(
                future: _service.getWebsiteData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SpinKitHourGlass(
                      color: Colors.black,
                      size: 100,
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 4 sütunlu bir grid
                        crossAxisSpacing: 8.0, // Sütunlar arası boşluk
                        mainAxisSpacing: 8.0, // Satırlar arası boşluk
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2.0),
                            // Sınırların renk ve kalınlığını belirleme
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // Kartın köşe yuvarlama),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    snapshot.data![index].english!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  ' ${snapshot.data![index].turkish}',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height:15,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    text1=snapshot.data![index].turkish!;
                                    text2= snapshot.data![index].english!;
                                    _submitForm();
                                    wordser.addWords(receivedData);
                                    // Butona tıklanınca yapılacak işlemler
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            ),
        );
    }
}