

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Service/Word_Service.dart';

import '../../Model/Users.dart';
import '../../Model/Webword.dart';
import '../../Model/Word.dart';
import '../../Service/food_service.dart';




class FoodsAndDrinksPage extends StatefulWidget {
  const FoodsAndDrinksPage({super.key});

  @override
  State<FoodsAndDrinksPage> createState() => _FoodsAndDrinksPageState();
}

class _FoodsAndDrinksPageState extends State<FoodsAndDrinksPage> {
  String text2 = '';
  String text1="";
  Words? words=Words();
  bool? isLoading;
  int? dada;
  ToeflWordsPage _service = ToeflWordsPage();
  List<Word> articles = [];

  @override
  void initState() {
    super.initState();
    sharedpref();
  }
  Future<void> sharedpref() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    dada=sharedPreferences.getInt("userId");
  }
  void _submitForm() {
    words?.userId = dada;
    words?.firstWord  = text1;
    words?.secondWord  = text2;
    words?.languageId=1;
    words?.showCounter=0;
    words?.sentence="";
  }
  wordservice wordser= wordservice();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: FutureBuilder<List<Word>>(
            future: _service.getWebsiteData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitHourGlass(
                  color:Colors.black,
                  size:100,
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 4 sütunlu bir grid
                    crossAxisSpacing: 8.0, // Sütunlar arası boşluk
                    mainAxisSpacing: 8.0, // Satırlar arası boşluk
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 2.0), // Sınırların renk ve kalınlığını belirleme
                        borderRadius: BorderRadius.circular(10.0),), // Kartın köşe yuvarlama),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Center(
                              child: Text(
                                snapshot.data![index].english!,
                                style: TextStyle(fontWeight: FontWeight.bold,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height:3,
                            ),
                            Text(
                              ' ${snapshot.data![index].turkish}',style: TextStyle(color: Colors.black),textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height:15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                text1=snapshot.data![index].turkish!;
                                text2= snapshot.data![index].english!;
                                _submitForm();
                                wordser.addWords(words);
                                setState(() {
                                  snapshot.data!.removeAt(index);
                                });
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