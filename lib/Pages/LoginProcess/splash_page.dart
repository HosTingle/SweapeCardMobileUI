import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BottomNavigatorBars.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? finaluser;
  String? finalpassword;
  @override
  void initState() {

    getValidationData().whenComplete(()async{
      Timer(
          Duration(seconds: 3),
              () =>Get.off(()=>finaluser==null && finalpassword==null ? LoginPage():BottomNavigators())
      );
    });
    super.initState();
  }
  Future<void> getValidationData()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var username=sharedPreferences.getString("username");
    var pass=sharedPreferences.getString("password");
    setState(() {
      finalpassword=pass;
      finaluser=username;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.network("https://lottie.host/94684192-802d-4b9f-8eaa-95f00555a134/zT82lcSxMm.json",width: 2000,height: 2000)
      ),
    );
  }
}