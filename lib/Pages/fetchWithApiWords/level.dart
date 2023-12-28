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

import '../../Service/level_service.dart';
import '../../provider/card_provider.dart';

class WordsByLevelsPage extends StatefulWidget {
  final String seviye;

  const WordsByLevelsPage({super.key, required this.seviye});

  @override
  _WordsByLevelsPageState createState() => _WordsByLevelsPageState();
}

class _WordsByLevelsPageState extends State<WordsByLevelsPage> {
  String text2 = '';
  String text1="";
  int? dada;
  @override
  void initState() {
    super.initState();
    sharedpref();
    _fetchData();
  }
  Future<void> sharedpref() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    dada=sharedPreferences.getInt("userId");
  }
  bool? isLoading;
  WordsByLevelsService _service = WordsByLevelsService();
  List<Word> articles = [];
  String selectedLetter = 'a'; // Varsayılan olarak 'a' harfi seçilmiş

  final List<String> alphabet = List.generate(26, (index) => String.fromCharCode('a'.codeUnitAt(0) + index));

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Get.back();provider.resetUsers();}, icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    final Words receivedData = Get.arguments;
    wordservice wordser= wordservice();
    void _submitForm() {
      receivedData.userId = dada;
      receivedData.firstWord  = text1;
      receivedData.secondWord  = text2;
      receivedData.languageId=1;
      receivedData.showCounter=0;
      receivedData.sentence="";
    }
    if (isLoading == true) {
      return SpinKitHourGlass(
        color: Colors.black,
        size: 100,
      );
    } else if (articles.isEmpty) {
      return Center(
        child: Text('No data available.'),
      );
    } else {
      return GridView.builder(
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
                      articles[index].english!,
                      style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    ' ${articles[index].turkish}',
                    style: TextStyle(color: Colors.black),textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height:15,
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        text1 = articles[index].turkish!;
                        text2 = articles[index].english!;
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
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void _fetchData() {
    setState(() {
      isLoading = true;
      articles = []; // Clear the existing data
    });

    _service.getWebsiteData(widget.seviye).then((data) {
      setState(() {
        isLoading = false;
        articles = data;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $error');
      });
    }
}