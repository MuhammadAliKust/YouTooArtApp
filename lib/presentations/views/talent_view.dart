import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_2_art/presentations/elements/app_button_icon.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow.dart';
import 'package:you_2_art/presentations/elements/app_button_short.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';
import 'package:you_2_art/presentations/elements/grid_view_widget_talent.dart';
import 'package:you_2_art/presentations/elements/search_file.dart';

class TalentView extends StatefulWidget {
  @override
  _TalentViewState createState() => _TalentViewState();
}

class _TalentViewState extends State<TalentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFF6E0),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.bell_fill,
                          size: 17,
                          color: Color(0xffFEB400),
                        ),
                        Booster.dynamicFontSize(
                            label: '9+',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                ),
                Booster.horizontalSpace(7),
                Icon(Icons.menu, size: 22, color: Colors.black)
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: AuthTextFieldSimple(label: 'Actor,Hyderabad', number: 1)),
              Booster.horizontalSpace(10),
              Booster.dynamicFontSize(
                  label: 'Fliter',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ],
          ),
          Booster.verticalSpace(25),
          GridViewWidget(),
        ],
      ),
        ),
      ),
    );
  }
}
