import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class AppButtonLarge extends StatelessWidget {
  final String text;
  final Color backgroundcolor;
  final Color shadowcolor;
  final Color textcolor;
  final VoidCallback onTap;

  AppButtonLarge(
      {required this.onTap,
      required this.text,
      required this.backgroundcolor,
      required this.shadowcolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Booster.dynamicFontSize(
              fontFamily: 'Raleway',
              label: text,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textcolor),
        ),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: backgroundcolor,
          onSurface: Colors.grey,
          shadowColor: shadowcolor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        onPressed: () =>onTap(),
      ),
    );
  }
}
