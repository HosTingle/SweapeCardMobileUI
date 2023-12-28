import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Model/Webword.dart';
import '../../Model/Word.dart';
import '../../Service/Word_Service.dart';
import '../../Service/webscraping_Service.dart';

class WebScraping extends StatefulWidget {
  const WebScraping({super.key});

  @override
  State<WebScraping> createState() => _WebScrapingState();
}

class _WebScrapingState extends State<WebScraping> {
  String text2 = '';

  String text1="";
  bool? isLoading;
  WebService _service = WebService();
  List<Word> articles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Words receivedData = Get.arguments;
    void _submitForm() {
      receivedData.userId = 1;
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
                leading: IconButton(onPressed: () => Navigator.pop(context), icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
                title: const Text("Words", style: TextStyle(
                    color: Colors.white
                )),
                centerTitle: true,
              ),
              body: FutureBuilder<List<Word>>(
                future: _service.getWebsiteData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("Bilgiler yükleniyor",style: TextStyle(
                              fontSize: 40,color: Colors.black
                          )),
                        ),
                        SpinKitWave(
                          color:Colors.black,
                          size:100,
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 4 sütunlu bir grid
                        crossAxisSpacing: 8.0, // Sütunlar arası boşluk
                        mainAxisSpacing: 8.0, // Satırlar arası boşluk
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.black, width: 2.0), // Sınırların renk ve kalınlığını belirleme
                            borderRadius: BorderRadius.circular(10.0),), // Kartın köşe yuvarlama),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    snapshot.data![index].english!,
                                    style: TextStyle(fontWeight: FontWeight.bold,),
                                  ),
                                ),
                                const SizedBox(
                                  height:8,
                                ),
                                Text(
                                  ' ${snapshot.data![index].turkish}',style: TextStyle(color: Colors.black),
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