import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/presentations/views/activity_home.dart';
import 'package:you_2_art/presentations/views/talent_view.dart';
import 'package:you_2_art/presentations/views/user_profile.dart';
import 'package:you_2_art/presentations/views/user_profile_edit_view.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserProvider>(context,listen: false).getUserDetails());
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrapper"),
      ),
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
            child: Text("Connections"),
          ),
        ],
      ),
    );
  }
}
