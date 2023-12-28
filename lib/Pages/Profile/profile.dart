import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Model/Users.dart';
import 'package:untitled4/Pages/Profile/profilemenu.dart';
import 'package:untitled4/Pages/Profile/updateprofile.dart';
import 'package:untitled4/provider/user_prodiver.dart';

import '../LoginProcess/login_page.dart';




class MainPag extends StatefulWidget {
  final Users user;

  const MainPag({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPag> {
  void initState() {
    super.initState();
  }
  Future<void> signOut() async {
    // SharedPreferences'ten verileri al ve sıfırla
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // Diğer çıkış işlemleri
  }
   signOut2() {
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.clearData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                /// -- IMAGE
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(  // Add border styling here
                          color: Colors.black,
                          width: 2.0,  // Adjust the border width as needed
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage("${widget.user.imagePath}")),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 7,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.height * 0.030,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.1),
                          color: Colors.white,
                          border: Border.all(  // Add border styling here
                            color: Colors.black,
                            width: 1.0,  // Adjust the border width as needed
                          ),
                        ),
                        child: Center(child: const FaIcon(FontAwesomeIcons.userLarge, color: Colors.black,size: 18,)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(widget.user.username!, style: TextStyle(
                  color: Colors.black,
                  fontSize: 30
                )),
                const SizedBox(height: 5),
                Text("${widget.user.name} ${widget.user.surname}", style: TextStyle(
                    color: Colors.black
                )),
                const SizedBox(height: 7),
                Text("${widget.user.description}", style: TextStyle(
                    color: Colors.black
                )),
                SizedBox(height: 23,),
                /// -- MENU
                ProfileMenuWidget(title: "Edit Profile",icon:Icons.account_box,  onPress: ()async {Users? result=await Get.to(() => const UpdateProfileScreen(),arguments: widget.user);
                setState(() {
                  if(result?.name!=null) {
                    widget.user!.name = result!.name;
                    widget.user!.surname = result!.surname;
                    widget.user!.username = result!.username;
                  }
                });
                } ),
                ProfileMenuWidget(title: "Settings", icon:Icons.settings , onPress: () {},),
                ProfileMenuWidget(title: "Premium Account", icon:Icons.verified_user_outlined, onPress: () {},),
                const Divider(height: 30,color: Colors.black,thickness: 3),

                ProfileMenuWidget(title: "Information", icon:Icons.info, onPress: () {}),
                ProfileMenuWidget(
                    title: "Logout",
                    icon:Icons.arrow_back,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                      Get.defaultDialog(
                        title: "LOGOUT",
                        titleStyle: const TextStyle(fontSize: 20),
                        content: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text("Are you sure want to exit ?"),
                        ),
                        confirm: Container(
                          height: 38,
                          child: ElevatedButton(
                            onPressed:(){
                              signOut();
                              signOut2();
                              Get.offAll(() => LoginPage());
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Dikdörtgenin kenar yuvarlaklığı
                          ),),
                            child: const Text("Yes",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            )),
                          ),
                        ),
                        cancel: OutlinedButton(onPressed: () => {Navigator.pop(context)}, child: const Text("No",style: TextStyle(color: Colors.black),)),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}