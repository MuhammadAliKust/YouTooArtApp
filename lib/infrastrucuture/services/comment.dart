import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';

class CommentServices {
  ///Get Specific Post Comments
  Stream<List<CommentModel>> streamPostComment(String postID) {
    return FirebaseFirestore.instance
        .collection('commentCollection')
        .where('postID', isEqualTo: postID)
        .orderBy('time', descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => CommentModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  ///Add Comments
  Future addPostComment(CommentModel commentModel) {
    return FirebaseFirestore.instance
        .collection('commentCollection')
        .add(commentModel.toJson(commentModel.docId.toString()));
  }
}
