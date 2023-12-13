import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/Model/Webword.dart';
import 'package:untitled4/Service/Word_Service.dart';
import 'package:untitled4/provider/card_provider.dart';

import '../Model/Word.dart';

class GoogleTranslate extends StatefulWidget {
  @override
  State<GoogleTranslate> createState() => _GoogleTranslateState();
}


class _GoogleTranslateState extends State<GoogleTranslate> {
  final Words receivedData = Get.arguments;
  String translated = '';
  String apiKey='';
  String text1="";
  String _mesaj="";
  TextEditingController firstTextFieldController = TextEditingController();
  TextEditingController firstTextFieldController2 = TextEditingController();
  void sa(){
    firstTextFieldController.text=translated;
  }
  void _submitForm() {
    receivedData.userId = 1;
    receivedData.firstWord  = text1;
    receivedData.secondWord  = translated;
    receivedData.languageId=1;
    receivedData.showCounter=0;
    receivedData.sentence="";
  }
  wordservice wordser= wordservice();
  OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {

    sa();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(onPressed: () { translated="";Get.back();}, icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
            title: Text("Add Word", style: TextStyle(
                color: Colors.white
            )),
            centerTitle: true,
          ),
          body: Card(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('English', textAlign: TextAlign.center),

                  TextFormField(
                    controller:firstTextFieldController2 ,
                    decoration: const InputDecoration(
                      hintText: 'Text',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 10),
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (sa) async {
                      text1=sa;
                      const apiKey='AIzaSyDy0CmAlKCA5kYrQujDMGKblMSsZCrW9mE';
                      const to='tr';
                      final url=Uri.parse('https://translation.googleapis.com/language/translate/v2'
                          '?q=$sa&target=$to&key=$apiKey',
                      );
                      final  response = await http.post(url);

                      if (response.statusCode==200){
                        final body=json.decode(response.body);
                        final translations=body['data']['translations'] as List;
                        final translation = HtmlEscape().convert(
                          translations.first['translatedText'],
                        );

                        setState(() {
                          translated=translation;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 40), // Add some spacing between the text fields
                  const Text('Turkish', textAlign: TextAlign.center),
                  TextFormField(
                    controller: firstTextFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Text',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),


                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                      wordser.addWords(receivedData);
                      translated="";
                      text1="";
                      firstTextFieldController.clear();
                      firstTextFieldController2.clear();
                      _showOverlay();
                      setState(() {
                        _mesaj="Mesaj eklendi";
                      });
                    },
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size(50, 50),
                      primary: Colors.black, // Buton rengini siyah yapar
                    ),
                    child: FaIcon(FontAwesomeIcons.plusCircle),
                  ),

                ],
              ),

            ),
          )),

    );
  }
  void _showOverlay() {
    // Container oluştur

    // Başarılı mesajı oluştur
    final successMessage = 'Başarılı oldu!';
    final overlayMessage = Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          successMessage,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );

    // OverlayEntry'leri oluştur
    _overlayEntry = OverlayEntry(
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          overlayMessage,
          SizedBox(height: 100,)
        ],
      ),
    );

    // Overlay'e ekle
    Overlay.of(context)?.insert(_overlayEntry!);

    // 2 saniye sonra overlay entry'yi kaldır
    Timer(Duration(seconds: 2), () {
      _overlayEntry?.remove();
    });
  }
}
