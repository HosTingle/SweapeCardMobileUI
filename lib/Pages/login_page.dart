import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Service/user_Service.dart';

import '../Model/Loginmodel.dart';
import 'BottomNavigatorBars.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  userservice userser=userservice();
  OverlayEntry? _overlayEntry;
  Login sa=Login();
  void login() async{
    sa.username = _usernameController.text;
    sa.password = _passwordController.text;
    var user=await userser.loginhuser(sa);
    if(user.userId!=null){
      final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setInt("userId", user.userId!);
      sharedPreferences.setString("username", user.username!);
      sharedPreferences.setString("password", user.password!);
      _showOverlay("Giriş Başarılı",200);
      Get.to(() => BottomNavigators());
    }
    else {
      _showOverlay("Kullanıcı adı veya şifre bulunamadı",2000);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Container(
                  height: 200,
                  width: 400,
                  child: Lottie.network("https://lottie.host/94684192-802d-4b9f-8eaa-95f00555a134/zT82lcSxMm.json",width: 2000,height: 2000),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue with",style: TextStyle(
                        fontSize: 13,color: Colors.grey
                    )),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 50,width: 183,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white, // Kenar rengi
                            width: 1.5, // Kenar kalınlığı
                          ),
                          color: Colors.grey[900],

                        ),
                          child: Image.asset("assets/images/face12.png",width: 2,height: 5,),
                        ),
                        SizedBox(width: 10,),
                        Container(height: 50,width: 183,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white, // Kenar rengi
                            width: 1.5, // Kenar kalınlığı
                          ),
                          color: Colors.grey[900],
                        ),
                          child: Image.asset("assets/images/gogas.png",width: 10,height: 10,),
                        )
                      ],
                    ),
                    const SizedBox(height:50.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Username",style:TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),)
                        ]),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                      obsn: false,
                      hintText: '',
                      icon:FontAwesomeIcons.userLarge, controller: _usernameController,
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Password",style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),)
                        ]),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                      obsn: true,
                      hintText: '',
                      icon: FontAwesomeIcons.unlockKeyhole, controller: _passwordController,
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Yuvarlak kenarlık
                          ),
                          primary: Colors.white, // Buton rengini siyah yapar
                        ),

                        onPressed: () {
                          login();
                        },
                        child: const Text('Login Account',style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        )),
                      ),
                    ),
                    SizedBox(height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have an account?",style: TextStyle(
                            color: Colors.grey,fontSize: 16
                        ),),
                        SizedBox(width: 10,),
                        Text("Sign up",style: TextStyle(
                            color: Colors.white,fontSize: 16
                        ),),
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showOverlay(String sa,int say) {
    // Container oluştur

    // Başarılı mesajı oluştur
    final successMessage = sa;
    final overlayMessage = Material(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          successMessage,
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
        ),
      ),
    );

    _overlayEntry = OverlayEntry(
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          overlayMessage,
          const SizedBox(height: 100,)
        ],
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);

    Timer(Duration(milliseconds: say), () {
      _overlayEntry?.remove();
    });
  }

}
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obsn;

  const CustomTextField({
    required this.hintText,
    required this.icon, required this.controller, required this.obsn,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsn,
      controller: controller ,
      style: TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
        filled: true,
        focusColor: Colors.white,
        fillColor: Colors.grey[900],
        hintText: hintText,
        suffixIcon: Icon(icon,color: Colors.white,size: 18,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0), // Köşeliliği ayarlamak için
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0), // Köşeliliği ayarlamak için
          ),
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
      ),
    );
  }
}