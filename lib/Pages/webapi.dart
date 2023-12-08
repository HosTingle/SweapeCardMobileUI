import 'package:flutter/material.dart';
import 'ApiS.dart';

class WebApiPage extends StatefulWidget {
  const WebApiPage({super.key});

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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
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
                          width: 200,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebScraping()));
                            },
                            child: Stack(
                                children:[
                                  Image.asset("assets/images/sa1.jpg"),
                                   const Positioned(
                                child: Center(

                                ),
                                   ),]
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