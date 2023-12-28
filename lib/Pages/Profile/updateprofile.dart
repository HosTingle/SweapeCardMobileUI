import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Service/user_Service.dart';

import '../../Model/Users.dart';
import '../../provider/card_provider.dart';
import '../../provider/user_prodiver.dart';

class UpdateProfileScreen extends StatefulWidget {

  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final Users receivedData = Get.arguments;
  bool isObscure = true;
  bool isempty = true;
  bool isenable=true;
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  TextEditingController _textFieldController3 = TextEditingController();
  TextEditingController _textFieldController4 = TextEditingController();
  TextEditingController _textFieldController5 = TextEditingController();

  userservice userService=userservice();
  void _submitForm() {
    receivedData.name = _textFieldController1.text;
    receivedData.surname  = _textFieldController2.text;
    receivedData.phone  = _textFieldController3.text;
    receivedData.username  = _textFieldController4.text;
    receivedData.password  = _textFieldController5.text;
  }
  void fetchdatafromapi() {
    isenable=false;
    _textFieldController1.text=receivedData.name!;
    _textFieldController2.text=receivedData.surname!;
    _textFieldController3.text=receivedData.phone!;
    _textFieldController4.text=receivedData.username!;
    _textFieldController5.text=receivedData.password!;
  }
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context,listen: false);
    if(isenable)
    fetchdatafromapi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed:() {
          Get.back();

          },
            icon: const FaIcon(FontAwesomeIcons.arrowLeft,color: Colors.white,)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // -- IMAGE with ICON

              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textFieldController1,

                      decoration: const InputDecoration(
                          label: Text("Name",style: TextStyle(
                            color: Colors.black
                          )), prefixIcon:FaIcon(FontAwesomeIcons.user,color: Colors.black),),

                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name boş bırakılamaz';
                        }
                        else if (value.length < 3) {
                          return 'Name en az 3 karakter olmalıdır';
                        }

                        return null;
                      },

                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _textFieldController2,

                      decoration: const InputDecoration(
                          label: Text("Surname",style: TextStyle(
                              color: Colors.black
                          ),), prefixIcon:FaIcon(FontAwesomeIcons.userLarge,color: Colors.black)),
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Surname boş bırakılamaz';
                        }
                        else if (value.length < 3) {
                          return 'Şifre en az 3 karakter olmalıdır';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _textFieldController3,

                      decoration: const InputDecoration(
                          label: Text("PhoneNo",style: TextStyle(
                              color: Colors.black
                          )), prefixIcon: FaIcon(FontAwesomeIcons.phone,color: Colors.black,)),
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone boş bırakılamaz';
                        }
                        else if (value.length != 11) {
                          return 'Phone 11 karakter olmalıdır';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _textFieldController4,

                      decoration: const InputDecoration(
                          label: Text("Username",style: TextStyle(
                              color: Colors.black
                          )), prefixIcon:FaIcon(FontAwesomeIcons.userGear,color: Colors.black,)),
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username boş bırakılamaz';
                        }
                        else if (value.length < 3) {
                          return 'Usename en az 3 karakter olmalıdır';
                        }
                        else if (value.length < 8) {
                          return 'Username en az 8 karakter olmalıdır';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 31 - 20),
                    TextFormField(
                      controller:_textFieldController5 ,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Şifre boş bırakılamaz';
                        }

                        else if (value.length < 8) {
                          return 'Şifre en az 8 karakter olmalıdır';
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
                        return null;
                      },
                      obscureText: isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        label: const Text("Password",style: TextStyle(
                          color: Colors.black
                        )),
                        prefixIcon: const FaIcon(FontAwesomeIcons.lock,color: Colors.black),
                        suffixIcon: IconButton(icon:Icon(isObscure ?Icons.visibility_off :  Icons.visibility),
                            onPressed: () {
                          setState(() {
                            isObscure=!isObscure;
                          }
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 21),
                    SizedBox(height:50 ,),
                    // -- Form Submit Button
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            _submitForm();
                            userService.UpdateUser(receivedData);
                            Get.back(result: receivedData);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Edit", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // -- Created Date and Delete Button
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}