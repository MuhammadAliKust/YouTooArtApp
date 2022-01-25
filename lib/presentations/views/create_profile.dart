import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:booster/booster.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow.dart';
import 'package:you_2_art/presentations/elements/app_button_short.dart';
import 'package:you_2_art/presentations/elements/auth_text_field.dart';

class CreateProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Booster.verticalSpace(20),
                Booster.dynamicFontSize(
                    label: 'Almost There...',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
                Booster.verticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 53,
                        backgroundImage: AssetImage('assets/images/images.png'),
                      ),
                    ),
                  ],
                ),
                Booster.verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtonLarge(onTap: (){},
                        text: 'Upload Picture',
                        backgroundcolor: Colors.white,
                        shadowcolor: Color(0xffF1F1F1),
                        textcolor: Colors.black),
                  ],
                ),
                Booster.verticalSpace(45),
                Row(
                  children: [
                    Expanded(child: AuthTextFieldBorder(label: 'First Name', number: 1)),
                    Booster.horizontalSpace(10),
                    Expanded(child: AuthTextFieldBorder(label: 'Last Name', number: 1)),
                  ],
                ),
                Booster.verticalSpace(20),
                Row(
                  children: [
                    Expanded(child: AuthTextFieldBorder(label: 'City', number: 1)),
                    Booster.horizontalSpace(10),
                    Expanded(child: AuthTextFieldBorder(label: 'State', number: 1)),
                  ],
                ),
                Booster.verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Booster.dynamicFontSize(
                        label: 'Enter a short bio.',
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ],
                ),
                Booster.verticalSpace(30),
                AuthTextFieldBorder(label: 'Ex. Software engineer by week,script writer by weekend.', number: 4),
                Booster.verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButtonShort(onTap: (){}, text: 'Done', color: FrontEndConfigs.kPrimaryColor),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
