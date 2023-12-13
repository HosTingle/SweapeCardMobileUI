import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Model/Word.dart';
import 'package:untitled4/Profile/profile.dart';
import 'package:untitled4/provider/card_provider.dart';
import 'package:untitled4/Pages/SwapCard.dart';
import 'package:untitled4/provider/user_prodiver.dart';
import 'Pages/AddWordPage.dart';
import 'Pages/BottomNavigatorBars.dart';
import 'Pages/Cardadd.dart';
import 'Pages/LeaderBoard.dart';
import 'Pages/webapi.dart';
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
      home: BottomNavigators(),
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
    return userlistee.isEmpty? Center(
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
      ):
     leader(
          users: userlistee);
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
    final provider = Provider.of<UserProvider>(context);
    final users = provider.userss;
    if(users.username==null){
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

            ],
          ),
        ),
      ),
    ),
  );


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
    final users = provider.words;
    final status = provider.getStatus();
    final isLike = status == CardStatus.like;
    final isDislike = status == CardStatus.dislike;
    final isSuperLike = status == CardStatus.superLike;

    return users.isEmpty
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