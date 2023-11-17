import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Model/Word.dart';
import 'package:untitled4/Service/user_Service.dart';
import 'package:untitled4/provider/user_prodiver.dart';
import '../widget/numbers_widget.dart.dart';


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
  userservice user=userservice();
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery
          .of(context)
          .size;

      final provider = Provider.of<UserProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.network(
      "https://i.ytimg.com/vi/vxUMYdj8SIE/maxresdefault.jpg",
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(

    radius: profileHeight / 2,
    backgroundColor: Colors.white,
    child: CircleAvatar(
      radius: profileHeight / 2 - 6,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(
        'https://i.ytimg.com/vi/vxUMYdj8SIE/maxresdefault.jpg',
      ),
    ),
  );

  Widget buildContent() => Column(
    children: [
      const SizedBox(height: 8),
      Text(
       widget.user.name!,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        widget.user.username!,
        style: TextStyle(fontSize: 20, color: Colors.black54),
      ),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialIcon(FontAwesomeIcons.slack),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.github),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.twitter),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.linkedin),
        ],
      ),
      const SizedBox(height: 16),
      Divider(),
      const SizedBox(height: 16),
      NumbersWidget(),
      const SizedBox(height: 16),
      Divider(),
      const SizedBox(height: 16),
      buildAbout(),
      const SizedBox(height: 32),
    ],
  );

  Widget buildAbout() => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          widget.user.description!,
          style: TextStyle(fontSize: 18, height: 1.4),
        ),
      ],
    ),
  );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
    radius: 25,
    child: Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Center(child: Icon(icon, size: 32)),
      ),
    ),
  );
}