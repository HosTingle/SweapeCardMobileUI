import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Model/Webword.dart';
import '../../Service/ielts_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/Webword.dart';
import '../../Model/Word.dart';
import '../../Service/Word_Service.dart';
import '../../Service/yokdil_service.dart';
import '../../provider/card_provider.dart';

class IeltsPage extends StatefulWidget {
  const IeltsPage({Key? key}) : super(key: key);

  @override
  State<IeltsPage> createState() => _IeltsPageState();
}

class _IeltsPageState extends State<IeltsPage> {
  String text2 = '';
  String text1="";
  int? dada;
  List<Word?> articles=[];
  IeltsService _service = IeltsService();
  String selectedLetter = 'a';
  final GlobalKey<_IeltsPageState> _refreshKey = GlobalKey<_IeltsPageState>();
  @override
  void initState(){
    super.initState();
    sharedpref();
    wordslist();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {});
    });
  }
  Future<void> sharedpref() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    dada=sharedPreferences.getInt("userId");
  }
  Future<void> wordslist() async{
     articles=await _service.getWebsiteData(selectedLetter);
     setState(() {
     });
  }
  bool? isLoading;


   // Varsayılan olarak 'a' harfi seçilmiş

  final List<String> alphabet = List.generate(26, (index) => String.fromCharCode('a'.codeUnitAt(0) + index));
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
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context,listen: false);
    if (articles.isEmpty) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
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
          ),
        ),
      );
    }
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: true,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                _buildDropdownButton(),
              ],
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          articles[index]!.english!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          articles[index]!.turkish!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            text1 = articles[index]!.turkish!;
                            text2 = articles[index]!.english!;
                            _submitForm();
                            wordser.addWords(receivedData);
                            setState(() {
                              articles.removeAt(index);
                            });
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
            ),
          ),
        ),
      );
    }
  }

  Widget _buildDropdownButton() {
    return Container(
        margin: EdgeInsets.only(right: 16.0),
        child: PopupMenuButton<String>(
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            onSelected: (String result) {
              setState(() {
                selectedLetter = result;
              });
            },
            itemBuilder: (BuildContext context) => alphabet
                .map((String choice) => PopupMenuItem<String>(
              value: choice,
              child: Text(choice.toUpperCase()),
            ))
                .toList(),
            ),
        );
    }
}