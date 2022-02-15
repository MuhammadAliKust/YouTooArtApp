import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';
import 'package:you_2_art/infrastrucuture/models/friend_request.dart';
import 'package:you_2_art/infrastrucuture/models/friends_model.dart';

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

  Future<void> sendFriendRequest(
      {required String myID, required String otherID}) async {
    DocumentReference _docRef =
        FirebaseFirestore.instance.collection('friendRequests').doc();
    await _docRef.set(FriendRequestModel(otherId: otherID, myId: myID)
        .toJson(_docRef.id.toString()));
  }

  Stream<List<FriendRequestModel>> streamFriendRequests(String myID) {
    return FirebaseFirestore.instance
        .collection('friendRequests')
        .where('myID', isEqualTo: myID)
        .snapshots()
        .map((event) => event.docs
            .map((e) => FriendRequestModel.fromJson(e.data()))
            .toList());
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

  //Save  Request to session
  Future<void> acceptFriendRequest(
      {required String myID,
      required String otherID,
      required String docID}) async {
    print(myID);
    print(otherID);
    DocumentReference _docRef = FirebaseFirestore.instance
        .collection('friends')
        .doc(myID)
        .collection("myFriends")
        .doc();
    DocumentReference _docRef1 = FirebaseFirestore.instance
        .collection('friends')
        .doc(otherID)
        .collection("myFriends")
        .doc();
    await _docRef.set(FriendsModel(id: otherID).toJson(_docRef.id.toString()));

    await _docRef1.set(FriendsModel(id: myID).toJson(_docRef1.id.toString()));
    await deleteData(docID);
  }

  Future<void> deleteData(String docID) {
    return FirebaseFirestore.instance
        .collection('friendRequests')
        .doc(docID)
        .delete();
  }

  Stream<List<FriendsModel>> streamMyFriends(String myID) {
    return FirebaseFirestore.instance
        .collection('friends')
        .doc(myID)
        .collection('myFriends')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => FriendsModel.fromJson(e.data())).toList());
  }
}
