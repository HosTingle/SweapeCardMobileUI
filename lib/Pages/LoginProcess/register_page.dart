import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Service/user_Service.dart';
import 'package:flutter/services.dart';
import '../../Model/Loginmodel.dart';
import '../../Model/Users.dart';
import '../BottomNavigatorBars.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Users sa = Users();
  Login sas = Login();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birtdateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  userservice userser=userservice();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submitForm() {
    sa?.username = _usernameController.text;
    sa?.password  = _passwordController.text;
    sa?.name  = _nameController.text;
    sa?.surname = _surnameController.text;
    sa?.birthDate  = DateTime.parse(_birtdateController.text!);
    sa?.phone  = _phoneController.text;
    sa?.description  = _descriptionController.text;
  }
  String? _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Şifre boş olamaz';
    } else if (value.length < 6) {
      return 'Şifre en az 6 karakter olmalıdır';
    }
    else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Şifre en az bir küçük harf içermelidir';
    }
    else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Şifre en az bir büyük harf içermelidir';
    }
    else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Şifre en az bir rakam içermelidir';
    }
    else if (!RegExp(r'(?=.*[!@#\$%^&*(),.?":{}|<>])').hasMatch(value)) {
      return 'Şifre en az bir özel karakter içermelidir';
    }
    else if (value.isEmpty) {
      return 'Onay şifresi boş olamaz';
    } else if (value != _passwordController2.text) {
      return 'Şifreler uyuşmuyor';
    }
    return null; // Geçerli
  }
  String? _validatename(String value) {
    if (value.isEmpty) {
      return 'Name boş olamaz';
    } else if (value.length < 2) {
      return 'Name en az 2 karakter olmalıdır';
    }
    return null; // Geçerli
  }
  String? _validatesurname(String value) {
    if (value.isEmpty) {
      return 'Surname boş olamaz';
    } else if (value.length < 1) {
      return 'Name en az 1 karakter olmalıdır';
    }
    return null; // Geçerli
  }
  String? _validatedate(String value) {
    if (value.isEmpty) {
      return 'date boş olamaz';
    }
    return null; // Geçerli
  }
  String? _validatephone(String value) {
    if (value.isEmpty) {
      return 'Phone boş olamaz';
    }
    else if (value.length < 10) {
      return 'Name en az 10 karakter olmalıdır';
    }
    return null; // Geçerli
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
                Form(
                  key:_formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign Up with",style: TextStyle(
                          fontSize: 13,color: Colors.grey
                      )),
                      SizedBox(height: 10,),
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
                      const SizedBox(height:40.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Username",style:TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 8.0),
                      CustomTextField(

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username boş olamaz';
                          } else if (value.length < 8) {
                            return 'Username en az 8 karakter olmalıdır';
                          }
                          return null; // Geçerli
                        },
                        obsn: false,
                        hintText: '',
                        icon:FontAwesomeIcons.userLarge,
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Password",style:TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 8.0),
                      CustomTextField(
                        validator: (value){
                          return _validateConfirmPassword(value!);
                        },
                        obsn: true,
                        hintText: '',
                        icon:FontAwesomeIcons.unlockKeyhole, controller: _passwordController,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Password",style:TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 7.0),
                      CustomTextField(
                        obsn: true,
                        hintText: '',
                        icon:null, controller: _passwordController2,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Name",style:TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 7.0),
                      CustomTextField(
                        validator: (value) {
                          return _validatename(value!);
                        },
                        obsn: false,
                        hintText: '',
                        icon:null, controller: _nameController,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Surname",style:TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 7.0),
                      CustomTextField(
                        validator: (value) {
                          return _validatesurname(value!);
                        },
                        obsn: false,
                        hintText: '',
                        icon:null, controller: _surnameController,
                      ),
                      const SizedBox(height: 7.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Birth Date",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 7.0),
                      CustomTextField(
                        validator: (value) {
                          return _validatedate(value!);
                        },
                        keyboardType: TextInputType.none,
                        obsn: false,
                        hintText: '',
                        icon: FontAwesomeIcons.calendarXmark, controller: _birtdateController,
                        onTap: ()async{
                          DateTime? pickeddate=await showDatePicker(
                              context: context,
                              initialDate:DateTime.now(),
                              firstDate: DateTime(1920),
                              lastDate: DateTime(2100)
                          );
                          if(pickeddate!=null){
                            setState(() {
                              _birtdateController.text=DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Phone",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 7.0),
                      IntlPhoneField(
                        validator: (value) {
                          return _validatephone(value.toString());
                        },
                        dropdownTextStyle: TextStyle(
                          color: Colors.white
                        ),
                        initialCountryCode: "TR",
                        controller: _phoneController,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        keyboardType: TextInputType.phone,

                        decoration: InputDecoration(
                          counterStyle: TextStyle(
                            color: Colors.white
                          ),
                          prefixIconColor: Colors.white,
                          prefixStyle: TextStyle(
                            color: Colors.white
                          ),

                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          focusColor: Colors.white,
                          fillColor: Colors.grey[900],
                          hintText: "",
                          suffixIcon: Icon(FontAwesomeIcons.phone,color: Colors.white,size: 18,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0), // Köşeliliği ayarlamak için
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18.0),
                              // Köşeliliği ayarlamak için
                            ),
                            borderSide: BorderSide(color: Colors.white, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 1.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Description",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),)
                          ]),
                      const SizedBox(height: 7.0),
                      Container(
                        child: CustomTextField(
                          obsn: false,
                          hintText: '',
                          icon: FontAwesomeIcons.pencil, controller: _descriptionController,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(height: 20,),
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

                          onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                _submitForm();
                                userser.CreateUser(sa!);
                                Get.offAll(() => LoginPage());
                              }
                          },
                          child: const Text('Sign Up',style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          )),
                        ),
                      ),
                      SizedBox(height: 35,),

                    ],
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
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final bool obsn;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const CustomTextField({
    required this.hintText,
    required this.icon, required this.controller, required this.obsn, this.onTap, this.keyboardType, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: (value) {

        },
        validator: validator ,
        keyboardType: keyboardType,
        onTap: onTap,
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
              Radius.circular(18.0),
              // Köşeliliği ayarlamak için
            ),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
        ),
      ),
    );
  }
}