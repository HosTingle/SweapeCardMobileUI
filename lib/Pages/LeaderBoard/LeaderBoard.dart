import 'package:flutter/material.dart';

import '../../Model/Users.dart';

class leader extends StatelessWidget {
  final List<Users> users;
  const leader({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    winnercontainer(he: 160,first: false,sayi: "2",renk: Colors?.green!,url:users[1]!.imagePath! ?? "",ad: users[1]!.username! ?? "",puan:users[1]!.score!.toString() ?? ""),
                    winnercontainer(he: 170,first: true,sayi: "1",renk: Colors.amber,url:users[0].imagePath! ?? "",ad: users[0].username! ?? "",puan:users[0].score!.toString() ?? ""),
                    winnercontainer(he: 150,first: false,sayi: "3",renk: Colors.blue,url:users[2].imagePath! ?? "",ad: users[2].username! ?? "",puan:users[2].score!.toString() ?? ""),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.96,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.orange,
                          width: 3
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text("Rank",style: TextStyle(
                            color: Colors.white
                        ),
                        ),
                        SizedBox(width: 20,),
                        Text("Person",style: TextStyle(
                            color: Colors.white
                        ),
                        ),
                        SizedBox(width: 20,),
                        Text("Score",style: TextStyle(
                            color: Colors.white
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                  ),
                  gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black,
                      ]
                  )
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                      ),
                      color: Colors.white
                  ),
                  child:ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return userlist(
                        siralama: (index + 4).toString(),
                        url: users[index+3].imagePath!,
                        ad: users[index+3].username!,
                        puan: users[index+3].score.toString(),
                      );
                    },
                  ),

                ),
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
class userlist extends StatelessWidget {
  String siralama;
  String url;
  String ad;
  String puan;
  userlist({super.key,required this.siralama,required this.url,required this.ad,required this.puan});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10,bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.055,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Center(
                      child: Text(
                        siralama,style: const TextStyle(
                          color: Colors.black
                      ),
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(url,height: MediaQuery.of(context).size.height * 0.03, width: MediaQuery.of(context).size.width * 0.1,fit: BoxFit.fitHeight,),),
                  Text(ad,style: const TextStyle(
                      color: Colors.white
                  ),)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(puan,style: const TextStyle(
                      color: Colors.white
                  ),),
                  const Icon(Icons.diamond,color: Colors.white,)
                ],
              ),


            ],
          ),
        ),

      ),
    );
  }
}

class winnercontainer extends StatelessWidget {
  double he;
  bool first;
  String sayi;
  Color renk;
  String url;
  String puan;
  String ad;
  winnercontainer({super.key,required this.he,required this.first,required this.sayi,required this.renk,required this.url,required this.puan,required this.ad});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.006,),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08,),
            child: Center(
              child: Container(
                height: he,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.11,),topRight: Radius.circular(MediaQuery.of(context).size.width * 0.11,)),
                ),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                if(first)
                Image.asset("assets/images/sasaa.png",height: MediaQuery.of(context).size.height * 0.1,width: MediaQuery.of(context).size.width * 0.28,),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.065,left: MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.19,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image: AssetImage(url),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.14,left: MediaQuery.of(context).size.width * 0.121,),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.057,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: renk
                    ),
                    child: Center(
                      child: Text(
                        sayi,style: TextStyle(
                          color: Colors.white
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17,left: MediaQuery.of(context).size.width * 0.033),
            child: Column(

              children: [
                Text(ad,style: TextStyle(color: Colors.white,fontSize: 20),),
                Text(puan,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
          )
        ],
      ),
    );
  }
}



