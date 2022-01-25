import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_2_art/presentations/elements/auth_text_field.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';

class ActivityHomeEditPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                  Booster.horizontalSpace(15),
                  Expanded(child: AuthTextFieldSimple(label: 'What\'s new?', number: 1))
                ],
              ),
              Booster.verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              Booster.verticalSpace(5),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/person.jpg'),
                        ),
                        Booster.horizontalSpace(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Booster.dynamicFontSize(
                                label: 'Pawan Kalyan',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            Booster.verticalSpace(3),
                            Booster.dynamicFontSize(
                                label: 'Actor,Writer',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff989898)),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.more_vert_sharp,
                      color: Color(0xff7A8FA6),
                    )
                  ],
                ),
              ),
              Booster.verticalSpace(20),
              Container(
                height: 209,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/post.png'),
                    )),
              ),
              Booster.verticalSpace(13),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.heart_solid,
                          color: Color(0xff7A8FA6),
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
                    Booster.dynamicFontSize(
                        label: '2 mins',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff989898)),
                  ],
                ),
              ),
              Booster.verticalSpace(30),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/person.jpg'),
                        ),
                        Booster.horizontalSpace(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Booster.dynamicFontSize(
                                label: 'Pawan Kalyan',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            Booster.verticalSpace(3),
                            Booster.dynamicFontSize(
                                label: 'Actor,Writer',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff989898)),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.more_vert_sharp,
                      color: Color(0xff7A8FA6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55,right: 30),
                child: Booster.dynamicFontSize(
                    label:
                    'Wow! Just amazing. I love your profile content. Look forward to see more.Well done!',
                    fontSize: 12,
                    lineHeight: 1.3,
                    fontWeight: FontWeight.w400,
                    isAlignCenter: false),
              ),
              Booster.verticalSpace(13),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.heart_solid,
                          color: Color(0xff7A8FA6),
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
                    Booster.dynamicFontSize(
                        label: '2 mins',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff989898)),
                  ],
                ),
              ),
              Booster.verticalSpace(30),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/person.jpg'),
                        ),
                        Booster.horizontalSpace(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Booster.dynamicFontSize(
                                label: 'Pawan Kalyan',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            Booster.verticalSpace(3),
                            Booster.dynamicFontSize(
                                label: 'Actor,Writer',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff989898)),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.more_vert_sharp,
                      color: Color(0xff7A8FA6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55,right: 30),
                child: Booster.dynamicFontSize(
                    label:
                    'Wow! Just amazing. I love your profile content. Look forward to see more.Well done!',
                    fontSize: 12,
                    lineHeight: 1.3,
                    fontWeight: FontWeight.w400,
                    isAlignCenter: false),
              ),
              Booster.verticalSpace(13),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.heart_solid,
                          color: Color(0xff7A8FA6),
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
                    Booster.dynamicFontSize(
                        label: '2 mins',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff989898)),
                  ],
                ),
              ),
              Booster.verticalSpace(20),],
          ),
        ),
      ),
    );
  }
}
