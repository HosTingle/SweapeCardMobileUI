import 'package:flutter/cupertino.dart';
import 'package:untitled4/Service/user_Service.dart';

import '../Model/Word.dart';




class UserProvider extends ChangeNotifier {
  userservice userser=userservice();
  Users? sa;
  Users userss= Users();
  List<Users> _users = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  Users get users => userss;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;
  UserProvider() {
    getuser();
  }
  void getuser() async{
    userss=await userser.fetchuserid(1);
    notifyListeners();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;
}