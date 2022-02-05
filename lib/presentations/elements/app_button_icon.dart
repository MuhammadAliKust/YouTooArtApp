import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class AppButtonIcon extends StatelessWidget {
  final IconData Icons;
  final Color backgroundcolor;
  final Color shadowcolor;
  final Color textcolor;
  final VoidCallback onTap;

  AppButtonIcon(
      {required this.onTap,
      required this.Icons,
      required this.backgroundcolor,
      required this.shadowcolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextButton(
        child: Center(child: Icon(Icons,color: textcolor,)),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: backgroundcolor,
          onSurface: Colors.grey,
          shadowColor: shadowcolor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () =>onTap(),
      ),
    );
  }
}
