import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.black:Colors.black ;

    return ListTile(
      onTap: onPress,
      leading: Container(
        height: MediaQuery.of(context).size.height * 0.03,
        width: MediaQuery.of(context).size.width * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        child: Icon(icon, color: Colors.white,size: 16),
      ),
      title: Text(title,
        style: TextStyle(
          fontSize: 15
        ),

      ),
      trailing: endIcon? Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: const FaIcon(FontAwesomeIcons.angleRight,color: Colors.black,size: 18),): null,
    );
  }
}