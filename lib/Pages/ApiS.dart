import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Model/Webword.dart';
import '../Service/webscraping_Service.dart';

class WebScraping extends StatefulWidget {
  const WebScraping({super.key});

  @override
  State<WebScraping> createState() => _WebScrapingState();
}

class _WebScrapingState extends State<WebScraping> {
  bool? isLoading;
  WebService _service = WebService();
  List<Word> articles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
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
                                    snapshot.data![index].english,
                                    style: TextStyle(fontWeight: FontWeight.bold,),
                                  ),
                                ),
                                const SizedBox(
                                  height:3,
                                ),
                                Text(
                                  ' ${snapshot.data![index].turkish}',style: TextStyle(color: Colors.black),
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