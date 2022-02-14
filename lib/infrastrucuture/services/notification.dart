import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/notification.dart';

class NotificationServices {
  ///Add Notifications
  Future addNotification(NotificationModel notificationModel) async {
    DocumentReference _docRef =
        FirebaseFirestore.instance.collection('notificationCollection').doc();
    await _docRef.set(notificationModel.toJson(_docRef.id.toString()));
  }

  ///Get My Notifications
  Stream<List<NotificationModel>> streamMyNotifications(List<String> docID) {
    print(docID);
    return FirebaseFirestore.instance
        .collection('notificationCollection')
        .where('authorID', whereIn: docID)
        .snapshots()
        .map((event) => event.docs
            .map((e) =>
                NotificationModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  ///Get Unread Notifications
  Stream<List<NotificationModel>> streamUnReadNotifications(String uid) {
    return FirebaseFirestore.instance
        .collection('notificationCollection')
        .where('seenByUsers', arrayContains: uid)
        .snapshots()
        .map((event) => event.docs
            .map((e) =>
                NotificationModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }
}
