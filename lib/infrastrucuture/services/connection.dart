import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';

class ConnectionServices {
  ///Add Connection Request
  Future<void> addConnectionRequest(ConnectionModel connectionModel) async {
    DocumentReference _docRef =
        FirebaseFirestore.instance.collection('connections').doc();
    await _docRef.set(connectionModel.toJson(_docRef.id.toString()));
  }

  ///Get Accepted Connections
  Stream<List<ConnectionModel>> streamAcceptedConnection(String userID) {
    print(userID);
    return FirebaseFirestore.instance
        .collection('connections')
        .where('userID', isEqualTo: userID)
        .where('accepted', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) =>

                ConnectionModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }
}
