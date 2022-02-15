import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/presentations/elements/app_drawer.dart';
import 'package:you_2_art/presentations/views/activity_home.dart';
import 'package:you_2_art/presentations/views/chats/recent_chat_list.dart';
import 'package:you_2_art/presentations/views/friend_request_list.dart';
import 'package:you_2_art/presentations/views/my_friends_view.dart';
import 'package:you_2_art/presentations/views/talent_view.dart';
import 'package:you_2_art/presentations/views/user_profile.dart';
import 'package:you_2_art/presentations/views/user_profile_edit_view.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserProvider>(context, listen: false).getUserDetails());
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrapper"),
      ),
      endDrawer: AppDrawer(),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Get.to(() => UserProfile(true));
            },
            child: Text("Profile"),
          ),
          RaisedButton(
            onPressed: () {
              Get.to(() => UserProfileEdit());
            },
            child: Text("Edit Profile"),
          ),
          RaisedButton(
            onPressed: () {
              Get.to(() => ActivityHome());
            },
            child: Text("Posts"),
          ),
          RaisedButton(
            onPressed: () {
              Get.to(() => TalentView());
            },
            child: Text("Registered Users"),
          ),
          RaisedButton(
            onPressed: () {
              Get.to(() => FriendRequestList());
            },
            child: Text("Friend Request List"),
          ),
          RaisedButton(
            onPressed: () {
              Get.to(() => MyFriendsView());
            },
            child: Text("My Friends List"),
          ),
          RaisedButton(
            onPressed: () {
              Get.to(() => RecentChatList());
            },
            child: Text("Recent Chats"),
          ),
        ],
      ),
    );
  }
}
