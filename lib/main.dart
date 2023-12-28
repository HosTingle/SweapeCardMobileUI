import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Model/Word.dart';
import 'package:untitled4/provider/card_provider.dart';
import 'package:untitled4/Pages/SwapCard/SwapCard.dart';
import 'package:untitled4/provider/user_prodiver.dart';
import 'Pages/LoginProcess/register_page.dart';
import 'Pages/Profile/profilemenu.dart';
import 'Pages/SwapCard/AddWordPage.dart';
import 'Pages/BottomNavigatorBars.dart';
import 'Pages/Profile/profile.dart';
import 'Pages/SwapCard/Cardadd.dart';
import 'Pages/LeaderBoard/LeaderBoard.dart';
import 'Pages/SwapCard/UpdateWordPage.dart';
import 'Pages/fetchWithApiWords/webapi.dart';
import 'Pages/LoginProcess/login_page.dart';
import 'Pages/LoginProcess/splash_page.dart';
import 'Service/Word_Service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  static final String title = 'Swap Card';

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
      create: (context) => CardProvider(),
    ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 32),
            elevation: 8,
            shape: CircleBorder(),
            minimumSize: Size.square(80),
          ),
        ),
      ),
    ),
  );
}


class listuser extends StatefulWidget {
  const listuser({super.key});

  @override
  State<listuser> createState() => _listuserState();
}

class _listuserState extends State<listuser> {
  @override
  Widget build(BuildContext context) =>tenuser();

  Widget tenuser(){
    final provider = Provider.of<UserProvider>(context);
    final userlistee = provider.use;
    if(userlistee.isEmpty){
      provider.gettenuser();
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Bilgiler yükleniyor",style: TextStyle(
                  fontSize: 40,color: Colors.black
              )),
            ),
            SpinKitHourGlass(
              color:Colors.black,
              size:200,
            )
          ],
        ),
      );
    }
    else{
      return leader(
          users: userlistee);
    }
  }

}
class transapi extends StatefulWidget {
  const transapi({super.key});

  @override
  State<transapi> createState() => _transapiState();
}

class _transapiState extends State<transapi> {
  @override
  Widget build(BuildContext context) {
    return apitrans();
  }
  Widget apitrans(){
    final provider = Provider.of<CardProvider>(context);
    final words = provider.saaaa;
    if(words?.firstWord==null){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Bilgiler yükleniyor",style: TextStyle(
                  fontSize: 40,color: Colors.black
              )),
            ),
            SpinKitPouringHourGlassRefined(
              color:Colors.black,
              size:200,
            )
          ],
        ),
      );
    }
    else{
      return WebApiPage(
        wordc: words,
      );
    }
  }
}

class wordstransform extends StatefulWidget {
  const wordstransform({super.key});

  @override
  State<wordstransform> createState() => _wordstransformState();
}

class _wordstransformState extends State<wordstransform> {
  @override
  Widget build(BuildContext context) {
    return  transfword();
  }
  Widget transfword(){
    final provider = Provider.of<CardProvider>(context);
    final words = provider.saaaa;
    if(words?.firstWord==null){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Bilgiler yükleniyor",style: TextStyle(
                  fontSize: 40,color: Colors.black
              )),
            ),
            SpinKitPouringHourGlassRefined(
              color:Colors.black,
              size:200,
            )
          ],
        ),
      );
    }
    else{
      return MyHomePage(
        wordk: words,
      );
    }
  }

}

class pasra extends StatefulWidget {
  const pasra({super.key});

  @override
  State<pasra> createState() => _pasraState();

}

class _pasraState extends State<pasra> {
  @override
  Widget build(BuildContext context)=> Container(
    decoration: BoxDecoration(
        color: Colors.white
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: buildUser(),
          ),
        ),
      ),
    );

  Widget buildUser() {
    final provider = Provider.of<UserProvider>(context,listen: true);
    final users = provider.userss;
    if(users.username==null){
      provider.getuser();
      return SafeArea(
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
              Text("", style: TextStyle(
                  color: Colors.black,
                  fontSize: 30
              )),
              const SizedBox(height: 5),
              Text("", style: TextStyle(
                  color: Colors.black
              )),
              const SizedBox(height: 7),
              Text("", style: TextStyle(
                  color: Colors.black
              )),
              SizedBox(height: 23,),
              /// -- MENU
              ProfileMenuWidget(title: "Edit Profile",icon:Icons.account_box,  onPress: () {
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
                      cancel: OutlinedButton(onPressed: () => {}, child: const Text("No",style: TextStyle(color: Colors.black),)),
                    );
                  }),
            ],
          ),
        ),
      );
    }
    else{
      return MainPag(
          user: users);
    }
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(child: buildCards()),
              const SizedBox(height: 16),
              buildButtons(),
              ButtonSpace()

            ],
          ),
        ),
      ),
    ),
  );

  Widget ButtonSpace() {
    final provider = Provider.of<CardProvider>(context);
    final words = provider.saaaa;
    final woba = provider.pos;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(

            minimumSize: Size(50, 50),
            primary: Colors.black, // Buton rengini siyah yapar
          ),
          child: FaIcon(FontAwesomeIcons.arrowLeft,color: Colors.white,size: 18),
        ),
        ElevatedButton(
          onPressed: () => Get.to(() => GoogleTranslate(),arguments: words),
          style: ElevatedButton.styleFrom(

            minimumSize: Size(50, 50),
            primary: Colors.black, // Buton rengini siyah yapar
          ),
          child: FaIcon(FontAwesomeIcons.plus,color: Colors.white,size: 18),
        ),
        ElevatedButton(
          onPressed: () => Get.to(() => UpdateWord(),arguments: woba),
          style: ElevatedButton.styleFrom(

            minimumSize: Size(50, 50),
            primary: Colors.black, // Buton rengini siyah yapar
          ),
          child: FaIcon(FontAwesomeIcons.pencil,color: Colors.white,size: 18),
        ),
      ],
    );
  }
  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final words = provider.words;
    return words.isEmpty
        ? const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Kelimeler yükleniyor",style: TextStyle(
                fontSize: 40,color: Colors.black
            )),
          ),
          SpinKitPulsingGrid(
            color: Colors.black,
            size:200,
          )
        ],
      ),
    )
        : Stack(
      children: words
          .map((word) => SwapCard(
        words: word,
        isFront: words.last == word,
      ))
          .toList(),
    );
  }

  Widget buildButtons() {
    final provider = Provider.of<CardProvider>(context);
    final wordnb= provider.words;
    final status = provider.getStatus();
    final isLike = status == CardStatus.like;
    final isDislike = status == CardStatus.dislike;
    final isSuperLike = status == CardStatus.superLike;

    return wordnb.isEmpty
        ? ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        'Restart',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.resetUsers();
      },
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      ],
    );
  }

  MaterialStateProperty<Color> getColor(
      Color color, Color colorPressed, bool force) {
    final getColor = (Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(
      Color color, Color colorPressed, bool force) {
    final getBorder = (Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return BorderSide(color: Colors.transparent);
      } else {
        return BorderSide(color: color, width: 2);
      }
    };

    return MaterialStateProperty.resolveWith(getBorder);
  }
}