import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
    if(user.password!=null){
      _showOverlay("Giriş Başarılı");
      Get.to(() => BottomNavigators());
    }
    else {
      _showOverlay("Kullanıcı adı veya şifre bulunamadı");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Kullanıcı Adı'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Şifre'),
            ),
            const SizedBox(height: 32.0),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const LinearBorder(),
                minimumSize: const Size(200, 70),
                primary: Colors.black, // Buton rengini siyah yapar
              ),

              onPressed: () {
                login();
              },
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
  void _showOverlay(String sa) {
    // Container oluştur

    // Başarılı mesajı oluştur
    final successMessage = sa;
    final overlayMessage = Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          successMessage,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
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

    Timer(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
    });
  }
}