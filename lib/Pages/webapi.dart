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
              child: SingleChildScrollView(
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
                        child: Text("YÖKDİL"),
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