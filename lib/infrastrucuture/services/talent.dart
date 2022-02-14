import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';

class TalentServices {
  ///Stream All Talent
  Stream<List<UserModel>> streamAllUsers(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return FirebaseFirestore.instance
        .collection('talentUsersCollection')
        .where('docID', isNotEqualTo: user.getUserDetails()!.docID.toString())
        .snapshots()
        .map((event) =>
            event.docs.map((e) => UserModel.fromJson(e.data())).toList());
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
