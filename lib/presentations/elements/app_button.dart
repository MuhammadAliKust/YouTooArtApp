import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  AppButton({required this.onTap, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Container(
        width: Booster.screenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Booster.paddedWidget(
              top: 17,
              bottom: 15,
              child: Booster.dynamicFontSize(
                  label: text,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ),
      ),
    );
  }
}