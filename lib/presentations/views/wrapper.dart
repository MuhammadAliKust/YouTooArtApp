import 'dart:io';

import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/services/auth.dart';
import 'package:you_2_art/presentations/elements/app_drawer.dart';
import 'package:you_2_art/presentations/elements/navigation_dialog.dart';
import 'package:you_2_art/presentations/views/activity_home.dart';
import 'package:you_2_art/presentations/views/chats/recent_chat_list.dart';
import 'package:you_2_art/presentations/views/talent_view.dart';

class WrapperView extends StatefulWidget {
  @override
  _WrapperViewState createState() => _WrapperViewState();
}

class _WrapperViewState extends State<WrapperView> {
  AuthServices _authServices = AuthServices();

  PersistentTabController? _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showNavigationDialog(context,
            message: 'Do you really want to exit from app?',
            buttonText: 'Yes', navigation: () {
          exit(0);
        }, secondButtonText: 'No', showSecondButton: true);
      },
      child: Scaffold(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
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
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          // Default is Colors.white.
          handleAndroidBackButtonPress: true,
          // Default is true.
          resizeToAvoidBottomInset: true,
          // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true,
          // Default is true.
          hideNavigationBarWhenKeyboardShows: true,
          // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.linearToEaseOut,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style3, // Choose the nav bar style with this property.
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      ActivityHome(),
      Container(),
      TalentView(),
      Container(),
      RecentChatList(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.home,
          size: 25,
        ),
        title: ("Home"),
        activeColorPrimary: FrontEndConfigs.kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.video_camera,
          size: 25,
        ),
        title: ("Channel"),
        activeColorPrimary: FrontEndConfigs.kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.group_solid,
          size: 25,
        ),
        title: ("Talent"),
        activeColorPrimary: FrontEndConfigs.kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.star,
          size: 25,
        ),
        title: ("Casting Calls"),
        activeColorPrimary: FrontEndConfigs.kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble,
          size: 25,
        ),
        title: ("Chats"),
        activeColorPrimary: FrontEndConfigs.kPrimaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
