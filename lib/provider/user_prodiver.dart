import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Service/user_Service.dart';

import '../Model/Users.dart';
class UserProvider extends ChangeNotifier {

  userservice userser=userservice();
  Users? sa;
  Users? ilk = Users(
    username: "sas",
  );
  Users userss= Users();
  List<Users> _users = [];
  bool _isDragging = false;
  double _angle = 0;

  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  Users get users => userss;
  List<Users> get use => _users;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;
  void getuser() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    int? dada=sharedPreferences.getInt("userId");
    userss=await userser.fetchuserid(dada);
    _users=await userser.fetchtenuser();
    notifyListeners();
  }
  void gettenuser() async{
    _users=await userser.fetchtenuser();
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    int? dada=sharedPreferences.getInt("userId");
    userss=await userser.fetchuserid(dada);
    notifyListeners();
  }
  void clearData() {
    userss.username=null;
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;
}