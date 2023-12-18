import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled4/Model/Word.dart';
import 'package:http/http.dart' as http;
import '../Model/User.dart';
import '../Model/Users.dart';
class register extends GetxController {
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController surname=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController description=TextEditingController();
  Future<void> registerad() async{

    try{
      var request={
        "avatarId": 7,
        "username": username.text,
        "password": password.text,
        "name": name.text,
        "surname": surname.text,
        "birthDate": DateFormat('2000-12-11'),
        "phone": phone.text,
        "description": description.text,
      };
      print("fetch called");
      String url="https://10.0.2.2:7193/api/Users/UpdateUser";
      final uri= Uri.parse(url);
      final response=await http.put(uri, body:jsonEncode(request),headers: {
        'Content-Type': 'application/json', // Content-Type başlığını ekleyin
      });
      if (response.statusCode == 200) {
        // API yanıtı başarılı ise
        print("completed");

      } else {
        // Hata durumu ile başa çıkma
        throw Exception('Failed to load data from the API');
      }
    }
    catch(e){

    }
  }
}