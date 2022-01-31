import 'package:flutter/cupertino.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';

class UserProvider extends ChangeNotifier {
  TalentModel? _userModel;

  void saveUserDetails(TalentModel? userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  TalentModel? getUserDetails() => _userModel;
}
