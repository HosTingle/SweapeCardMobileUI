import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled4/Pages/fetchWithApiWords/ielts.dart';
import 'package:untitled4/Pages/fetchWithApiWords/story.dart';
import 'package:untitled4/Pages/fetchWithApiWords/toed.dart';
import 'package:untitled4/Pages/fetchWithApiWords/yokdil.dart';
import '../../Model/Word.dart';
import 'ApiS.dart';
import 'level.dart';

class WebApiPage extends StatefulWidget {
  Words? wordc;

  WebApiPage({
    Key? key,
    required this.wordc,
  }) : super(key: key);

  @override
  State<WebApiPage> createState() => _WebApiPageState();
}

class _WebApiPageState extends State<WebApiPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Text("Sınavlar",style: TextStyle(
                      fontSize: 20,color: Colors.black
                  )),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => ToeflPage(),arguments: widget.wordc);
                            },
                            child: Text("TOEFL"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => YokdilPage(),arguments: widget.wordc);

                            },
                            child: Text("YÖKDİL"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => IeltsPage(),arguments: widget.wordc);
                            },
                            child: Text("IELTS"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Seviye Göre",style: TextStyle(
                      fontSize: 20,color: Colors.black
                  )),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => WordsByLevelsPage(seviye: "A1"),arguments: widget.wordc);

                            },
                            child: Text("A1"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => WordsByLevelsPage(seviye: "A2"),arguments: widget.wordc);
                            },
                            child: Text("A2"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => WordsByLevelsPage(seviye: "B1"),arguments: widget.wordc);
                            },
                            child: Text("B1"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => WordsByLevelsPage(seviye: "B2"),arguments: widget.wordc);
                            },
                            child: Text("B2"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => WordsByLevelsPage(seviye: "C1"),arguments: widget.wordc);
                            },
                            child: Text("C1"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Temel kelimeler",style: TextStyle(
                      fontSize: 20,color: Colors.black
                  )),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
                            },
                            child: Text("Aylar"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
                            },
                            child: Text("Sayılar"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
                            },
                            child: Text("Yiyecekler"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("İngilizce Hikayeler",style: TextStyle(
                    fontSize: 20,color: Colors.black
                  )),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
                            },
                            child: Stack(
                                children:[
                                  Center(child: Image.asset("assets/images/s123.jpeg")),
                                  const Positioned(
                                    child: Center(
                                    ),
                                  ),]
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
                            },
                            child: Stack(
                                children:[
                                  Center(child: Image.asset("assets/images/sa12.jpeg")),
                                  const Positioned(
                                    child: Center(

                                    ),
                                  ),]
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 100,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                            },
                             child: Container(
                              width: 300.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(

                                  image: AssetImage("assets/images/avatar123.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
        );
   }
}