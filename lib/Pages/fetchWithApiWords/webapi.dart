import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled4/Pages/fetchWithApiWords/eats.dart';
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
      debugShowCheckedModeBanner: false,
        home: Scaffold(

            body: Center(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Text("Exams",style: TextStyle(
                        fontSize: 25,color: Colors.black
                    )),
                    SizedBox(height: 5,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => ToeflPage(),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.39, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/tofels.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => YokdilPage(),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.2, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/yökdil.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => IeltsPage(),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.15, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/ielts.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("By Level",style: TextStyle(
                        fontSize: 25,color: Colors.black
                    )),
                    SizedBox(height: 5,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => WordsByLevelsPage(seviye: "A1"),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.2, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/A11.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => WordsByLevelsPage(seviye: "A2"),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.2, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/A22.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => WordsByLevelsPage(seviye: "B1"),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.2, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/B11.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => WordsByLevelsPage(seviye: "B2"),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.2, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/B22.png"),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 5,
                          ),Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => WordsByLevelsPage(seviye: "C1"),arguments: widget.wordc);
                              },
                              child: Transform.scale(
                                scale: 1.2, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/c1asa.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Basic Words",style: TextStyle(
                        fontSize: 25,color: Colors.black
                    )),
                    SizedBox(height: 5,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => WebScraping()));
                              },
                              child: Transform.scale(
                                scale: 1.6, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/maranaa.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => WebScraping()));
                              },
                              child: Transform.scale(
                                scale: 1.8, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/zazaza.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => WebScraping()));
                              },
                              child: Transform.scale(
                                scale: 1.24, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/yemeknee.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Stories",style: TextStyle(
                      fontSize: 25,color: Colors.black
                    )),
                    SizedBox(height: 5,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => WebScraping()));
                              },
                              child: Transform.scale(
                                scale: 1.1, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/s123.jpeg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => WebScraping()));
                              },
                              child: Transform.scale(
                                scale: 1.1, // İstediğiniz ölçek faktörünü ayarlayabilirsiniz
                                child: Image.asset("assets/images/sa12.jpeg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.18,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                              },
                              child: Transform.scale(
                                scale: 0.96,
                                child: Image.asset("assets/images/pamak.jpg"),
                              ),
                              ),
                            ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
        );
   }
}