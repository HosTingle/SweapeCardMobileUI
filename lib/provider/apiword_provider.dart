import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Model/Webword.dart';
import 'package:untitled4/Service/user_Service.dart';

import '../Model/Users.dart';
class ApiWordProvider extends ChangeNotifier {

  userservice userser=userservice();
  Word? sa;
  Word _apiword= Word();
  List<Word> _apiwords = [];


  Word get apiword => _apiword;
  List<Word> get apiwords => _apiwords;



}