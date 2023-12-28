
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
import '../../Service/tofel_service.dart';
import '../../provider/card_provider.dart';


class ToeflPage extends StatefulWidget {
  const ToeflPage({Key? key}) : super(key: key);

  @override
  State<ToeflPage> createState() => _ToeflPageState();
}

class _ToeflPageState extends State<ToeflPage> {
  int? dada;
  bool? isLoading;
  TOEFLService _service = TOEFLService();
  List<Word> articles = [];
  String selectedLetter = 'a';
  // Varsayılan olarak 'a' harfi seçilmiş
  String text2 = '';
  String text1="";

  @override
  void initState() {
    super.initState();
    sharedpref();
  }
  Future<void> sharedpref() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    dada=sharedPreferences.getInt("userId");
  }
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
                automaticallyImplyLeading: true,
                leading: IconButton(onPressed: () { Get.back();provider.resetUsers();}, icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
                actions: [
                  PopupMenuButton<String>(
                    onSelected: (String result) {
                      setState(() {
                        selectedLetter = result;
                      });
                    },
                    itemBuilder: (BuildContext context) => ['a', 'b', 'c', 'd', 'e']
                        .map((String choice) => PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice.toUpperCase()),
                    ))
                        .toList(),
                  ),
                ],
              ),
              body: FutureBuilder<List<Word>>(
                future: _service.getWebsiteData(selectedLetter),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
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
                                  snapshot.data![index].english!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  ' ${snapshot.data![index].turkish}',textAlign: TextAlign.center,//textAlign ortalıyor.
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.normal,),
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