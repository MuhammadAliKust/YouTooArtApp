import 'package:flutter/cupertino.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';

class SearchProviders extends ChangeNotifier {
  List<PostModel> _list = [];
  List<UserModel> _connectionList = [];

  void savePostList(List<PostModel> list) {
    _list = list;
    // notifyListeners();
  }

  void saveConnectionList(List<UserModel> list) {
    _connectionList = list;
  }

  List<PostModel> getPostList() => _list;

  List<UserModel> getConnectionList() => _connectionList;
}
