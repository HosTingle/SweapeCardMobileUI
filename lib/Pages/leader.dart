import 'package:flutter/material.dart';

import '../Model/Users.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  winnercontainer(he: 160,first: false,sayi: "2",renk: Colors?.green!,url:users[1]!.imagePath! ?? "",ad: users[1]!.username! ?? "",puan:users[1]!.score!.toString() ?? ""),
                  winnercontainer(he: 170,first: true,sayi: "1",renk: Colors.amber,url:users[0].imagePath! ?? "",ad: users[0].username! ?? "",puan:users[0].score!.toString() ?? ""),
                  winnercontainer(he: 150,first: false,sayi: "3",renk: Colors.blue,url:users[2].imagePath! ?? "",ad: users[2].username! ?? "",puan:users[2].score!.toString() ?? ""),
                ],
              ),
              Container(
                height: 40,
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
              const SizedBox(height: 20,),
              Container(
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
                height: 300,
                width: 400,
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
                    height: 20,
                    width: 20,
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
                    child: Image.asset(url,height: 29, width: 29,fit: BoxFit.fitHeight,),),
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
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Container(
                height: he,
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                if(first)
                Image.asset("assets/images/sasaa.png",height: 100,width: 120,),
                Padding(
                  padding: const EdgeInsets.only(top: 60,left: 20),
                  child: Container(
                    height: 80,
                    width: 80,
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
                  padding: const EdgeInsets.only(top: 130,left: 50),
                  child: Container(
                    height: 20,
                    width: 20,
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
            padding: const EdgeInsets.only(top: 160.0,left: 13),
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



