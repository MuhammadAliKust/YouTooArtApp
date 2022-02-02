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
  Stream<TalentModel> fetchUserData(String docID) {
    return FirebaseFirestore.instance
        .collection('talentUsersCollection')
        .doc(docID)
        .snapshots()
        .map((event) => TalentModel.fromJson(event.data()!));
  }
}
