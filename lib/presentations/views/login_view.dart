import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:booster/booster.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/presentations/elements/app_button.dart';
import 'package:you_2_art/presentations/elements/auth_text_field.dart';
import 'package:you_2_art/presentations/elements/login_view_container_otp.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Booster.dynamicFontSize(
                label: 'By signing in, you are agree with our',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000)),
            Booster.dynamicFontSize(
                label: ' Terms & Conditions',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xffE70B89),
                isUnderline: true),
          ],
        ),
      ),
      body: ColorfulSafeArea(
        color: FrontEndConfigs.kPrimaryColor,
        child: SingleChildScrollView(
          child: Column(children: [
            Material(
              elevation: 7,
              color: Color(0x0D6200EE),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color:  FrontEndConfigs.kPrimaryColor,
                child: Column(
                  children: [
                    Booster.verticalSpace(70),
                    Image.asset('assets/images/logo.png',
                        height: 140, width: 230),
                    Booster.verticalSpace(90),
                    Booster.dynamicFontSize(
                        label: 'Connect. Collaborate. Create.',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8B6300)),
                    Booster.verticalSpace(10),
                  ],
                ),
              ),
            ),
            Booster.verticalSpace(35),
            Booster.dynamicFontSize(
                label: 'Enter mobile number and verify',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000)),
            Booster.verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: FrontEndConfigs.boxShadow,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Booster.dynamicFontSize(
                                label: '+91',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff707070),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff707070),
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                          child: AuthTextFieldBorder(
                              label: 'Email Mobile Number', number: 1)),
                    ],
                  ),
                  Booster.verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Booster.dynamicFontSize(
                          label: 'Get OTP',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffE70B89)),
                    ],
                  ),
                  Booster.verticalSpace(20),
                  Row(
                    children: [
                      Expanded(
                        child: OTPContainer(),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                        child: OTPContainer(),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                        child: OTPContainer(),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                        child: OTPContainer(),
                      ),
                    ],
                  ),
                  Booster.verticalSpace(40),
                  AppButton(
                      onTap: () {}, text: 'LOGIN', color:  FrontEndConfigs.kPrimaryColor,),
                  Booster.verticalSpace(10),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
