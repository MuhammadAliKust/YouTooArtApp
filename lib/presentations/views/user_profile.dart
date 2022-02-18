import 'package:booster/booster.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/presentations/elements/app_drawer.dart';
import 'package:you_2_art/presentations/elements/loading_widgets/loading_widget.dart';
import 'package:you_2_art/presentations/elements/user_profile_container_1.dart';
import 'package:you_2_art/presentations/views/my_posts.dart';

import 'create_post.dart';

class UserProfile extends StatefulWidget {
  final bool fromLogin;

  UserProfile(this.fromLogin);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isProfileSelected = true;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: isProfileSelected
          ? null
          : FloatingActionButton(
              backgroundColor: FrontEndConfigs.kPrimaryColor,
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Get.to(() => CreatePostView(
                    postModel: PostModel(), isUpdateMode: false));
              },
            ),
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
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(Icons.menu, size: 28, color: Colors.black),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: AppDrawer(),
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
                  skills: user.getUserDetails()!.categories!,
                  area: user.getUserDetails()!.city.toString() +
                      " " +
                      user.getUserDetails()!.state.toString(),
                  contactno: user.getUserDetails()!.connect.toString(),
                  postsno: user.getUserDetails()!.posts.toString(),
                  image: user.getUserDetails()!.image.toString()),
              Booster.verticalSpace(3),
              // if (!widget.fromLogin)
              //   Padding(
              //     padding: const EdgeInsets.only(left: 97),
              //     child: Row(
              //       children: [
              //         AppButtonLarge1(
              //             onTap: () {},
              //             text: 'Connect',
              //             backgroundcolor: Colors.white,
              //             shadowcolor: Color(0xffF1F1F1),
              //             textcolor: Colors.black),
              //         Booster.horizontalSpace(10),
              //         AppButtonLarge1(
              //             onTap: () {},
              //             text: 'Message',
              //             backgroundcolor: Colors.white,
              //             shadowcolor: Color(0xffF1F1F1),
              //             textcolor: Colors.black),
              //       ],
              //     ),
              //   ),
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
              if (!isProfileSelected) MyPostsView(),
              if (isProfileSelected)
                Booster.dynamicFontSize(
                    fontFamily: 'Raleway',
                    label: user.getUserDetails()!.shortBio.toString(),
                    fontSize: 14,
                    lineHeight: 1.2,
                    fontWeight: FontWeight.w400),
              if (isProfileSelected) Booster.verticalSpace(20),
              if (isProfileSelected)
                Row(
                  children: [
                    Column(
                      children: [
                        if (user.getUserDetails()!.image1 == null)
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
                        if (user.getUserDetails()!.image1 != null)
                          Container(
                            height: 108,
                            width: 108,
                            child: CachedNetworkImage(
                              imageUrl:
                                  user.getUserDetails()!.image1.toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                          Colors.red, BlendMode.colorBurn)),
                                ),
                              ),
                              placeholder: (context, url) => LoadingWidget(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        Booster.verticalSpace(10),
                        if (user.getUserDetails()!.image2 == null)
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
                        if (user.getUserDetails()!.image1 != null)
                          Container(
                            height: 108,
                            width: 108,
                            child: CachedNetworkImage(
                              imageUrl:
                                  user.getUserDetails()!.image2.toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                          Colors.red, BlendMode.colorBurn)),
                                ),
                              ),
                              placeholder: (context, url) => LoadingWidget(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                      ],
                    ),
                    Booster.horizontalSpace(10),
                    if (user.getUserDetails()!.image3 == null)
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
                    if (user.getUserDetails()!.image3 != null)
                      Expanded(
                        child: Container(
                          height: 255,
                          child: CachedNetworkImage(
                            imageUrl: user.getUserDetails()!.image3.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                    colorFilter: ColorFilter.mode(
                                        Colors.red, BlendMode.colorBurn)),
                              ),
                            ),
                            placeholder: (context, url) => LoadingWidget(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
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
