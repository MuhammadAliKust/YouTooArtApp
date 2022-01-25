import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';

class ActivityPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/person.jpg'),
            ),
            Booster.horizontalSpace(10),
            Expanded(child: AuthTextFieldSimple(label: 'Add a comment', number: 1)),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/post.png'),
                      )
                    ),
                  ),
                  Positioned.fill(
                      top: 30,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back,size: 25,color: Colors.white,),
                                Icon(Icons.more_vert_sharp,size: 25,color: Colors.white,)
                              ],
                            )
                          ))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Booster.verticalSpace(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 10),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.heart_solid,
                            color: Colors.red,
                            size: 18,
                          ),
                          Booster.horizontalSpace(3),
                          Booster.dynamicFontSize(
                              label: '247',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff7A8FA6)),
                          Booster.horizontalSpace(15),
                          ImageIcon(AssetImage('assets/images/Group 16131.png'),size: 15,color: Color(0xff7A8FA6)),
                          Booster.horizontalSpace(3),
                          Booster.dynamicFontSize(
                              label: '57',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff7A8FA6)),
                          Booster.horizontalSpace(15),
                          ImageIcon(AssetImage('assets/images/19.png'),size: 15,color: Color(0xff7A8FA6)),
                          Booster.horizontalSpace(3),
                          Booster.dynamicFontSize(
                              label: '33',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff7A8FA6)),
                        ],
                      ),
                    ),
                    Booster.verticalSpace(15),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
                    bottom: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/person.jpg'),
                      ),
                      Booster.horizontalSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Booster.dynamicFontSize(
                                  label: 'Michael Bruno',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              Booster.dynamicFontSize(
                                  label: '8h ago',
                                  fontSize: 11,
                                  color: Color(0xffACACAC),
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                          Booster.verticalSpace(5),
                          Booster.dynamicFontSize(
                              label: '#Photoshoot #Smile #Beautiful #Fashion',
                              fontSize: 11,
                              color: Color(0xff2FBBF0),
                              fontWeight: FontWeight.w400),
                          Booster.verticalSpace(5),
                          Container(
                            width: 250,
                            child: Booster.dynamicFontSize(
                                label: 'Cras gravida bibendum dolor eu varius. Ipsum fermentum velit nisl, eget vehicula.',
                                fontSize: 11,
                                isAlignCenter: false,
                                lineHeight: 1.3,
                                color: Color(0xff7A8FA6),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
                    bottom: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/person.jpg'),
                              ),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.heart_solid,color: Colors.red,size: 18,),
                                  Booster.dynamicFontSize(
                                      label: '19',
                                      fontSize: 11,
                                      color: Color(0xff7A8FA6),
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ],
                          ),
                          Booster.horizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Booster.dynamicFontSize(
                                      label: 'Emma Stone',
                                      fontSize: 15,
                                      color: Color(0xff7A8FA6),
                                      fontWeight: FontWeight.w700),
                                  Booster.dynamicFontSize(
                                      label: '8h ago',
                                      fontSize: 11,
                                      color: Color(0xffACACAC),
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                              Booster.verticalSpace(5),
                              Container(
                                width: 250,
                                child: Booster.dynamicFontSize(
                                    label: 'Wow! Just amazing. I love your profile content. Look forward to see more. Well done!',
                                    fontSize: 11,
                                    isAlignCenter: false,
                                    lineHeight: 1.3,
                                    color: Color(0xff7A8FA6),
                                    fontWeight: FontWeight.w400),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(CupertinoIcons.heart_solid,color: Colors.red,size: 18,)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
                    bottom: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/person.jpg'),
                              ),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.heart_solid,  color: Color(0xff7A8FA6),size: 18,),
                                  Booster.dynamicFontSize(
                                      label: '19',
                                      fontSize: 11,
                                      color: Color(0xff7A8FA6),
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ],
                          ),
                          Booster.horizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Booster.dynamicFontSize(
                                      label: 'Emma Stone',
                                      fontSize: 15,
                                      color: Color(0xff7A8FA6),
                                      fontWeight: FontWeight.w700),
                                  Booster.dynamicFontSize(
                                      label: '8h ago',
                                      fontSize: 11,
                                      color: Color(0xffACACAC),
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                              Booster.verticalSpace(5),
                              Container(
                                width: 250,
                                child: Booster.dynamicFontSize(
                                    label: 'Rhoncus ipsum eget tempus. Praesent con fermentum sa  rhoncus ipsum eget tem Praesent.',
                                    fontSize: 11,
                                    isAlignCenter: false,
                                    lineHeight: 1.3,
                                    color: Color(0xff7A8FA6),
                                    fontWeight: FontWeight.w400),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(CupertinoIcons.heart_solid,  color: Color(0xff7A8FA6),size: 18,)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
