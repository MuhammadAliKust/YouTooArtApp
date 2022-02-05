import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';

class UserServices {
  ///Add User Data
  Future<void> addUserData(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection('talentUsersCollection')
        .doc(userModel.docID)
        .set(userModel.toJson(userModel.docID.toString()));
  }

  ///Stream Specific User
  Stream<UserModel> fetchUserData(String docID) {
    return FirebaseFirestore.instance
        .collection('talentUsersCollection')
        .doc(docID)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  ///Check if User Exists
  Stream<List<UserModel>> checkUserExists(String number) {
    print(number);
    return FirebaseFirestore.instance
        .collection('talentUsersCollection')
        .where('phoneNumber', isEqualTo: number)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => UserModel.fromJson(e.data())).toList());
  }
}
