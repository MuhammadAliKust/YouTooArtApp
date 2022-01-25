import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';

class TalentServices {
  ///Stream All Talent
  Stream<List<TalentModel>> streamAllUsers() {
    return FirebaseFirestore.instance
        .collection('talentUsersCollection')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => TalentModel.fromJson(e.data())).toList());
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
