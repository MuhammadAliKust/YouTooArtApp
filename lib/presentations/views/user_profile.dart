import 'dart:io';

import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow_1.dart';
import 'package:you_2_art/presentations/elements/navigation_dialog.dart';
import 'package:you_2_art/presentations/elements/user_profile_container_1.dart';
import 'package:you_2_art/presentations/elements/user_profile_container_2.dart';
import 'package:you_2_art/presentations/views/activity_home.dart';
import 'package:you_2_art/presentations/views/talent_view.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return await showNavigationDialog(context,
            message: "Do you really want to exit from app?",
            buttonText: 'Yes', navigation: () {
          exit(0);
        }, secondButtonText: 'No', showSecondButton: true);
      },
      child: Scaffold(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.bell_fill,
                            size: 17,
                            color: FrontEndConfigs.kPrimaryColor,
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
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserProfileContainer1(
                    onTap: () {},
                    name: user.getUserDetails()!.firstName.toString() +
                        " " +
                        user.getUserDetails()!.lastName.toString(),
                    skills: 'Actor,Writer',
                    area: user.getUserDetails()!.city.toString() +
                        " " +
                        user.getUserDetails()!.state.toString(),
                    contactno: user.getUserDetails()!.connect.toString(),
                    postsno: user.getUserDetails()!.posts.toString(),
                    image: user.getUserDetails()!.image.toString()),
                Booster.verticalSpace(3),
                Padding(
                  padding: const EdgeInsets.only(left: 97),
                  child: Row(
                    children: [
                      AppButtonLarge1(
                          onTap: () {},
                          text: 'Connect',
                          backgroundcolor: Colors.white,
                          shadowcolor: Color(0xffF1F1F1),
                          textcolor: Colors.black),
                      Booster.horizontalSpace(10),
                      AppButtonLarge1(
                          onTap: () {},
                          text: 'Message',
                          backgroundcolor: Colors.white,
                          shadowcolor: Color(0xffF1F1F1),
                          textcolor: Colors.black),
                    ],
                  ),
                ),
                Booster.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Booster.verticalSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1.5),
                        ),
                      ),
                      child: Booster.dynamicFontSize(
                          fontFamily: 'Raleway',
                          label: 'Profile',
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    Booster.horizontalSpace(20),
                    Container(
                      child: Booster.dynamicFontSize(
                          fontFamily: 'Raleway',
                          label: 'Activity',
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Booster.verticalSpace(20),
                Booster.dynamicFontSize(
                    fontFamily: 'Raleway',
                    label: user.getUserDetails()!.shortBio.toString(),
                    fontSize: 14,
                    lineHeight: 1.2,
                    fontWeight: FontWeight.w400),
                Booster.verticalSpace(20),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 108,
                          width: 108,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/post.png'),
                              )),
                        ),
                        Booster.verticalSpace(10),
                        Container(
                          height: 108,
                          width: 108,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/post.png'),
                              )),
                        ),
                      ],
                    ),
                    Booster.horizontalSpace(10),
                    Expanded(
                      child: Container(
                        height: 225,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/post.png'),
                            )),
                      ),
                    ),
                  ],
                ),
                Booster.verticalSpace(25),
                Booster.dynamicFontSize(
                    label: 'My work',
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
                Booster.verticalSpace(10),
                UserProfileContainer2(
                    onTap: () {},
                    title: 'Photos:',
                    description: 'Photoshoot Drive'),
                Booster.verticalSpace(7),
                UserProfileContainer2(
                    onTap: () {},
                    title: 'Photos:',
                    description: 'Photoshoot Drive'),
                RaisedButton(
                    child: Text('Posts'),
                    onPressed: () {
                      Get.to(() => ActivityHome());
                    }),
                RaisedButton(
                    child: Text('Connections'),
                    onPressed: () {
                      Get.to(() => TalentView());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
