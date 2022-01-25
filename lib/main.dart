 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:you_2_art/presentations/views/activity_home.dart';
import 'package:you_2_art/presentations/views/activity_home_editpost.dart';
import 'package:you_2_art/presentations/views/activity_post_view.dart';
import 'package:you_2_art/presentations/views/choose_category_view.dart';
import 'package:you_2_art/presentations/views/create_profile.dart';
import 'package:you_2_art/presentations/views/talent_filter_view.dart';
import 'package:you_2_art/presentations/views/user_profile.dart';
import 'package:you_2_art/presentations/views/user_profile_edit_view.dart';
import 'package:you_2_art/presentations/views/user_profile_self.dart';
import 'package:you_2_art/presentations/views/login_view.dart';
import 'package:you_2_art/presentations/views/talent_view.dart';
import 'package:you_2_art/presentations/views/user_profile_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ActivityHome(),
    );
  }
}

