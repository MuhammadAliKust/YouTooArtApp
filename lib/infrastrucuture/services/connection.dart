import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';

class ConnectionServices {
  ///Add Connection Request
  Future<void> addConnectionRequest(
      {required String myID, required String otherID}) async {
    DocumentReference _docRef = FirebaseFirestore.instance
        .collection('connectionsList')
        .doc(myID)
        .collection('myConnections')
        .doc();
    await _docRef
        .set(ConnectionModel(userId: otherID).toJson(_docRef.id.toString()));
    DocumentReference _docRef1 = FirebaseFirestore.instance
        .collection('connectionsList')
        .doc(otherID)
        .collection('myConnections')
        .doc();
    await _docRef1
        .set(ConnectionModel(userId: myID).toJson(_docRef.id.toString()));
  }

  ///Get Accepted Connections
  Stream<List<ConnectionModel>> streamAcceptedConnection(String userID) {
    return FirebaseFirestore.instance
        .collection('connectionsList')
        .doc(userID)
        .collection('myConnections')
        .where('accepted', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) =>
                ConnectionModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  ///Get Accepted Connections
  Stream<List<ConnectionModel>> streamMyConnections(String userID) {
    return FirebaseFirestore.instance
        .collection('connectionsList')
        .doc(userID)
        .collection('myConnections')
        .snapshots()
        .map((event) => event.docs
            .map((e) =>
                ConnectionModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }
}
