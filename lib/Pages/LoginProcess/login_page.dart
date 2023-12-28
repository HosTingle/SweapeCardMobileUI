import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Pages/LoginProcess/register_page.dart';
import 'package:untitled4/Service/user_Service.dart';

import '../../Model/Loginmodel.dart';
import '../../Model/Users.dart';
import '../../Service/register_service.dart';
import '../../main.dart';
import '../BottomNavigatorBars.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  userservice userser=userservice();
  OverlayEntry? _overlayEntry;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _overlayEntry = _createOverlayEntry("Kullanıcı adı ve veya sifre yanlıs");
  }
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
      Get.off(() => BottomNavigators());
    }
    else {
      _showOverlay();
    }
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
                        Expanded(
                          child: Container(height: 53,decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white, // Kenar rengi
                              width: 1.5, // Kenar kalınlığı
                            ),
                            color: Colors.grey[900],

                          ),
                            child: Image.asset("assets/images/face12.png",width: 2,height: 5,),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(height: 53,decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white, // Kenar rengi
                              width: 1.5, // Kenar kalınlığı
                            ),
                            color: Colors.grey[900],
                          ),
                            child: Image.asset("assets/images/gogas.png",width: 10,height: 10,),
                          ),
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
                    ElevatedButton(
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
                    SizedBox(height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have an account?",style: TextStyle(
                            color: Colors.grey,fontSize: 16
                        ),),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                            Get.to(()=>RegisterPage());
                          },
                          child: Text("Sign up",style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
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
  OverlayEntry _createOverlayEntry(String mesaj) {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.width*0.24,
        left: MediaQuery.of(context).size.width*0.16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.06,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                mesaj,
                style: TextStyle(color: Colors.black,fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _showOverlay() {
    Overlay.of(context)?.insert(_overlayEntry!);

    // Eğer var olan bir timer varsa iptal et
    _timer?.cancel();

    _timer = Timer(Duration(seconds: 2), () {
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
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
    );
  }
}