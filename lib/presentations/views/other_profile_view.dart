import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow_1.dart';
import 'package:you_2_art/presentations/elements/user_profile_container_1.dart';
import 'package:you_2_art/presentations/views/my_posts.dart';

import 'chats/messages.dart';

class OtherUserProfileView extends StatefulWidget {
  final UserModel userModel;
  final bool showConnectBtn;

  OtherUserProfileView({required this.userModel, required this.showConnectBtn});

  @override
  _OtherUserProfileViewState createState() => _OtherUserProfileViewState();
}

class _OtherUserProfileViewState extends State<OtherUserProfileView> {
  bool isProfileSelected = true;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
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
                  name: widget.userModel.firstName.toString() +
                      " " +
                      widget.userModel.lastName.toString(),
                  skills: widget.userModel.categories!,
                  area: widget.userModel.city.toString() +
                      " " +
                      widget.userModel.state.toString(),
                  contactno: widget.userModel.connect.toString(),
                  postsno: widget.userModel.posts.toString(),
                  image: widget.userModel.image.toString()),
              Booster.verticalSpace(3),

              Padding(
                padding: const EdgeInsets.only(left: 97),
                child: Row(
                  children: [
                    if (!widget.showConnectBtn) Container(),
                    if (widget.showConnectBtn)
                      AppButtonLarge1(
                          onTap: () {},
                          text: 'Connect',
                          backgroundcolor: Colors.white,
                          shadowcolor: Color(0xffF1F1F1),
                          textcolor: Colors.black),
                    Booster.horizontalSpace(10),
                    AppButtonLarge1(
                        onTap: () {
                          Get.to(() => MessagesView(
                              receiverID: widget.userModel.docID.toString(),
                              myID: user.getUserDetails()!.docID.toString()));
                        },
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
                  InkWell(
                    onTap: () {
                      isProfileSelected = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: isProfileSelected
                          ? BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                            )
                          : null,
                      child: Booster.dynamicFontSize(
                          fontFamily: 'Raleway',
                          label: 'Profile',
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Booster.horizontalSpace(20),
                  InkWell(
                    onTap: () {
                      isProfileSelected = false;
                      setState(() {});
                    },
                    child: Container(
                      decoration: !isProfileSelected
                          ? BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                            )
                          : null,
                      child: Booster.dynamicFontSize(
                          fontFamily: 'Raleway',
                          label: 'Activity',
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Booster.verticalSpace(20),
              if (!isProfileSelected)
                MyPostsView(userID: widget.userModel.docID.toString()),
              if (isProfileSelected)
                Booster.dynamicFontSize(
                    fontFamily: 'Raleway',
                    label: widget.userModel.shortBio.toString(),
                    fontSize: 14,
                    lineHeight: 1.2,
                    fontWeight: FontWeight.w400),
              if (isProfileSelected) Booster.verticalSpace(20),
              if (isProfileSelected)
                Row(
                  children: [
                    Column(
                      children: [
                        if (widget.userModel.image1 == null)
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
                        if (widget.userModel.image1 != null)
                          Container(
                            height: 108,
                            width: 108,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      widget.userModel.image1.toString()),
                                )),
                          ),
                        Booster.verticalSpace(10),
                        if (widget.userModel.image2 == null)
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
                        if (widget.userModel.image2 != null)
                          Container(
                            height: 108,
                            width: 108,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      widget.userModel.image2.toString()),
                                )),
                          ),
                      ],
                    ),
                    Booster.horizontalSpace(10),
                    if (widget.userModel.image3 == null)
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
                    if (widget.userModel.image3 != null)
                      Expanded(
                        child: Container(
                          height: 225,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    widget.userModel.image3.toString()),
                              )),
                        ),
                      ),
                  ],
                ),
              Booster.verticalSpace(25),
              // Booster.dynamicFontSize(
              //     label: 'My work',
              //     fontSize: 21,
              //     fontWeight: FontWeight.w700),
              // Booster.verticalSpace(10),
              // UserProfileContainer2(
              //     onTap: () {},
              //     title: 'Photos:',
              //     description: 'Photoshoot Drive'),
              // Booster.verticalSpace(7),
              // UserProfileContainer2(
              //     onTap: () {},
              //     title: 'Photos:',
              //     description: 'Photoshoot Drive'),
            ],
          ),
        ),
      ),
    );
  }
}
