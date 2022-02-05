import 'package:flutter/cupertino.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;

  void saveUserDetails(UserModel? userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  UserModel? getUserDetails() => _userModel;
}
