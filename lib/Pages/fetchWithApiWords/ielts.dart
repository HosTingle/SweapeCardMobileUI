import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Model/Webword.dart';
import '../../Service/ielts_service.dart';
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

class IeltsPage extends StatefulWidget {
  const IeltsPage({Key? key}) : super(key: key);

  @override
  State<IeltsPage> createState() => _IeltsPageState();
}

class _IeltsPageState extends State<IeltsPage> {
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
  IeltsService _service = IeltsService();
  List<Word> articles = [];
  String selectedLetter = 'a'; // Varsayılan olarak 'a' harfi seçilmiş

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


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
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
          body: FutureBuilder<List<Word>>(
            future: _service.getWebsiteData(selectedLetter),
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
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: snapshot.data!.length,
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
                              snapshot.data![index].english,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              ' ${snapshot.data![index].turkish}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height:15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                text1=snapshot.data![index].turkish;
                                text2= snapshot.data![index].english;
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

  Widget _buildDropdownButton() {
    return Container(
        margin: EdgeInsets.only(right: 16.0),
        child: PopupMenuButton<String>(
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
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