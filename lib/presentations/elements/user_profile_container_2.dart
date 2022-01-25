import 'package:booster/booster.dart';
import 'package:flutter/material.dart';

class UserProfileContainer2 extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  UserProfileContainer2({required this.onTap, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Booster.dynamicFontSize(
                label: title,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff707070)),
            Booster.horizontalSpace(40),
            Booster.dynamicFontSize(
                label: description,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ],
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadowColor: Color(0xffF1F1F1),
          child: Container(
            height: 35,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 17,
                )),
          ),
        )
      ],
    );
  }
}