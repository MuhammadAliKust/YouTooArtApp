import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/app_state.dart';
import 'package:you_2_art/application/post_provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/presentations/views/activity_home_editpost.dart';
import 'package:you_2_art/presentations/views/login_view.dart';
import 'package:you_2_art/presentations/views/user_profile_edit_view.dart';
import 'package:you_2_art/presentations/views/user_profile_self.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppState()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => SearchProviders()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
