import 'package:booster/booster.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/presentations/views/friend_request_list.dart';
import 'package:you_2_art/presentations/views/login_view.dart';
import 'package:you_2_art/presentations/views/my_friends_view.dart';
import 'package:you_2_art/presentations/views/user_profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createDrawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () {
                Get.to(() => UserProfile(false));
              }),
          _createDrawerItem(
              icon: Icons.book,
              text: 'Friend Requests',
              onTap: () {
                Get.to(() => FriendRequestList());
              }),
          _createDrawerItem(
              icon: CupertinoIcons.group_solid,
              text: 'My Friends',
              onTap: () {
                Get.to(() => MyFriendsView());
              }),
          _createDrawerItem(
              icon: Icons.exit_to_app,
              text: 'Logout',
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.offAll(() => LoginView());
              }),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Booster.verticalSpace(10),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage(user.getUserDetails()!.image.toString()),
            ),
            Booster.verticalSpace(10),
            Booster.dynamicFontSize(
                label: user.getUserDetails()!.firstName.toString() +
                    " " +
                    user.getUserDetails()!.lastName.toString(),
                fontSize: 16),
          ],
        ));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
