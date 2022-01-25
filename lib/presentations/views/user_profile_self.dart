import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:booster/booster.dart';
import 'package:you_2_art/presentations/elements/app_button_icon.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow_1.dart';

class UserProfileSelf extends StatelessWidget {
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
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/person.jpg'),
                      ),
                      Positioned.fill(
                          bottom: -20,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 27,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffFEB400),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Center(
                                  child: Booster.dynamicFontSize(
                                      label: 'Edit Profile',
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ))),
                    ],
                  ),
                  Booster.horizontalSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Booster.dynamicFontSize(
                              label: 'Pawan Kalyan',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          Booster.horizontalSpace(5),
                          Icon(
                            CupertinoIcons.check_mark_circled_solid,
                            color: Colors.blue,
                            size: 17,
                          )
                        ],
                      ),
                      Booster.verticalSpace(3),
                      Booster.dynamicFontSize(
                          label: 'Actor,Writer',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7A8FA6)),
                      Booster.verticalSpace(7),
                      Booster.dynamicFontSize(
                          label: 'Hyderabad, Telangana',
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7A8FA6)),
                      Booster.verticalSpace(7),
                      Row(
                        children: [
                          Booster.dynamicFontSize(
                              label: '199',
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                          Booster.dynamicFontSize(
                              label: 'Connects',
                              fontSize: 9,
                              fontWeight: FontWeight.w700),
                          Booster.horizontalSpace(15),
                          Booster.dynamicFontSize(
                              label: '199',
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                          Booster.dynamicFontSize(
                              label: 'Posts',
                              fontSize: 9,
                              fontWeight: FontWeight.w700),
                        ],
                      )
                    ],
                  )
                ],
              ),
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
                        bottom: BorderSide(color: Colors.black,width: 1.5),
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
                  label: 'Software Engineer by week, actor by weekend. Open to work on short films and ads. ',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Booster.dynamicFontSize(
                          label: 'Video :',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                      color: Color(0xff707070)),
                      Booster.horizontalSpace(40),
                      Booster.dynamicFontSize(
                          label: 'My First Action Film',
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
                      child: Center(child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,)),
                    ),
                  )
                ],
              ),
              Booster.verticalSpace(7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Booster.dynamicFontSize(
                          label: 'Photos :',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff707070)),
                      Booster.horizontalSpace(30),
                      Booster.dynamicFontSize(
                          label: 'Photoshoot Drive',
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
                     child: Center(child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,)),
                   ),
                 )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
